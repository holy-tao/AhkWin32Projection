#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class USE_INFO_ASG_TYPE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static USE_WILDCARD => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static USE_DISKDEV => 0

    /**
     * @type {Integer (UInt32)}
     */
    static USE_SPOOLDEV => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USE_IPC => 3
}
