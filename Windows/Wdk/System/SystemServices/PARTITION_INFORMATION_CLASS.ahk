#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PARTITION_INFORMATION_CLASS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SystemMemoryPartitionInformation => 0

    /**
     * @type {Integer (Int32)}
     */
    static SystemMemoryPartitionDedicatedMemoryInformation => 9

    /**
     * @type {Integer (Int32)}
     */
    static SystemMemoryPartitionOpenDedicatedMemory => 10
}
