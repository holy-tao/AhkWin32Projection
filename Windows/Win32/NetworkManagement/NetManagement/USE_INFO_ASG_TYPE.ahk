#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
class USE_INFO_ASG_TYPE extends Win32Enum {

    /**
     * Native name: USE_WILDCARD
     * @type {Integer (UInt32)}
     */
    static WILDCARD => 4294967295

    /**
     * Native name: USE_DISKDEV
     * @type {Integer (UInt32)}
     */
    static DISKDEV => 0

    /**
     * Native name: USE_SPOOLDEV
     * @type {Integer (UInt32)}
     */
    static SPOOLDEV => 1

    /**
     * Native name: USE_IPC
     * @type {Integer (UInt32)}
     */
    static IPC => 3
}
