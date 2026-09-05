#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Memory
 */
class WIN32_MEMORY_PARTITION_INFORMATION_CLASS extends Win32Enum {

    /**
     * Native name: MemoryPartitionInfo
     * @type {Integer (Int32)}
     */
    static Info => 0

    /**
     * Native name: MemoryPartitionDedicatedMemoryInfo
     * @type {Integer (Int32)}
     */
    static DedicatedMemoryInfo => 1
}
