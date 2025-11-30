#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class USN_SOURCE_INFO_ID extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static USN_SOURCE_AUXILIARY_DATA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static USN_SOURCE_DATA_MANAGEMENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USN_SOURCE_REPLICATION_MANAGEMENT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static USN_SOURCE_CLIENT_REPLICATION_MANAGEMENT => 8
}
