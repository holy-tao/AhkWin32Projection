#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class CREATE_TAPE_PARTITION_METHOD extends Win32Enum {

    /**
     * Native name: TAPE_FIXED_PARTITIONS
     * @type {Integer (UInt32)}
     */
    static FIXED_PARTITIONS => 0

    /**
     * Native name: TAPE_INITIATOR_PARTITIONS
     * @type {Integer (UInt32)}
     */
    static INITIATOR_PARTITIONS => 2

    /**
     * Native name: TAPE_SELECT_PARTITIONS
     * @type {Integer (UInt32)}
     */
    static SELECT_PARTITIONS => 1
}
