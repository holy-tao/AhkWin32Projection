#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class CREATE_TAPE_PARTITION_METHOD extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_FIXED_PARTITIONS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_INITIATOR_PARTITIONS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_SELECT_PARTITIONS => 1
}
