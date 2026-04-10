#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Memory
 */
class WIN32_MEMORY_PARTITION_INFORMATION_CLASS extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static MemoryPartitionInfo => 0

    /**
     * @type {Integer (Int32)}
     */
    static MemoryPartitionDedicatedMemoryInfo => 1
}
