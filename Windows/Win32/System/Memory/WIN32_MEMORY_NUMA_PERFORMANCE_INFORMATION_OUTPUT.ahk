#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WIN32_MEMORY_NUMA_PERFORMANCE_ENTRY.ahk" { WIN32_MEMORY_NUMA_PERFORMANCE_ENTRY }

/**
 * @namespace Windows.Win32.System.Memory
 */
export default struct WIN32_MEMORY_NUMA_PERFORMANCE_INFORMATION_OUTPUT {
    #StructPack 8

    EntryCount : UInt32

    PerformanceEntries : WIN32_MEMORY_NUMA_PERFORMANCE_ENTRY[1]

}
