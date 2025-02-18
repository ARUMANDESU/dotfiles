#!/bin/bash

# Colors for better readability
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

print_header() {
    echo -e "\n${GREEN}=== $1 ===${NC}\n"
}

check_command() {
    if ! command -v $1 &> /dev/null; then
        echo -e "${RED}Warning: $1 is not installed. Some information may be missing.${NC}"
        return 1
    fi
    return 0
}

get_system_info() {
    print_header "SYSTEM INFORMATION"
    if check_command hostnamectl; then
        hostnamectl
    else
        echo "Operating System: $(cat /etc/os-release | grep PRETTY_NAME | cut -d'"' -f2)"
        echo "Kernel: $(uname -r)"
    fi
}

get_cpu_info() {
    print_header "CPU INFORMATION"
    if check_command lscpu; then
        lscpu | grep -E "Model name|Socket|Core|Thread|CPU MHz"
    else
        echo "CPU Info: $(cat /proc/cpuinfo | grep "model name" | uniq)"
    fi
}

get_memory_info() {
    print_header "MEMORY INFORMATION"
    if check_command free; then
        echo "Memory Usage:"
        free -h
    fi
    
    if [ -f "/proc/meminfo" ]; then
        echo -e "\nDetailed Memory Info:"
        cat /proc/meminfo | grep -E "MemTotal|MemFree|MemAvailable|SwapTotal|SwapFree"
    fi
}

get_disk_info() {
    print_header "DISK INFORMATION"
    if check_command df; then
        echo "Disk Usage:"
        df -h
    fi
    
    if check_command lsblk; then
        echo -e "\nBlock Devices:"
        lsblk
    fi
}

get_gpu_info() {
    print_header "GPU INFORMATION"
    if check_command lspci; then
        echo "Graphics Cards:"
        lspci | grep -i vga
    fi
    
    if check_command glxinfo; then
        echo -e "\nOpenGL Renderer:"
        glxinfo | grep "OpenGL renderer"
    fi
}

get_network_info() {
    print_header "NETWORK INFORMATION"
    if check_command ip; then
        echo "Network Interfaces:"
        ip addr show
    fi
    
    if check_command iwconfig; then
        echo -e "\nWireless Information:"
        iwconfig 2>/dev/null
    fi
}

get_battery_info() {
    print_header "BATTERY INFORMATION"
    if [ -d "/sys/class/power_supply/BAT1" ]; then
        echo "Battery Status:"
        cat /sys/class/power_supply/BAT1/status
        echo "Battery Capacity: $(cat /sys/class/power_supply/BAT1/capacity)%"
    else
        echo "No battery information available"
    fi
}

get_audio_info() {
    print_header "AUDIO INFORMATION"
    if check_command pactl; then
        echo "Audio Devices:"
        pactl list short sinks
    fi
}

# Main execution
echo -e "${BLUE}=== System Information Report ===${NC}"
echo "Generated on: $(date)"
echo "Hostname: $(hostname)"

get_system_info
get_cpu_info
get_memory_info
get_disk_info
get_gpu_info
get_network_info
get_battery_info
get_audio_info

echo -e "\n${BLUE}=== End of Report ===${NC}"
