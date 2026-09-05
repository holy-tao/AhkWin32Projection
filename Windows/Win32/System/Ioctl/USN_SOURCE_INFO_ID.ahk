#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class USN_SOURCE_INFO_ID extends Win32Enum {

    /**
     * Native name: USN_SOURCE_AUXILIARY_DATA
     * @type {Integer (UInt32)}
     */
    static AUXILIARY_DATA => 2

    /**
     * Native name: USN_SOURCE_DATA_MANAGEMENT
     * @type {Integer (UInt32)}
     */
    static DATA_MANAGEMENT => 1

    /**
     * Native name: USN_SOURCE_REPLICATION_MANAGEMENT
     * @type {Integer (UInt32)}
     */
    static REPLICATION_MANAGEMENT => 4

    /**
     * Native name: USN_SOURCE_CLIENT_REPLICATION_MANAGEMENT
     * @type {Integer (UInt32)}
     */
    static CLIENT_REPLICATION_MANAGEMENT => 8
}
