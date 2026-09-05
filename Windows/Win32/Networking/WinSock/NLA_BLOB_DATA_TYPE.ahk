#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
class NLA_BLOB_DATA_TYPE extends Win32Enum {

    /**
     * Native name: NLA_RAW_DATA
     * @type {Integer (Int32)}
     */
    static RAW_DATA => 0

    /**
     * Native name: NLA_INTERFACE
     * @type {Integer (Int32)}
     */
    static INTERFACE => 1

    /**
     * Native name: NLA_802_1X_LOCATION
     * @type {Integer (Int32)}
     */
    static 802_1X_LOCATION => 2

    /**
     * Native name: NLA_CONNECTIVITY
     * @type {Integer (Int32)}
     */
    static CONNECTIVITY => 3

    /**
     * Native name: NLA_ICS
     * @type {Integer (Int32)}
     */
    static ICS => 4
}
