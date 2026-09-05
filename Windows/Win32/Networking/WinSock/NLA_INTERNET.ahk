#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
class NLA_INTERNET extends Win32Enum {

    /**
     * Native name: NLA_INTERNET_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * Native name: NLA_INTERNET_NO
     * @type {Integer (Int32)}
     */
    static NO => 1

    /**
     * Native name: NLA_INTERNET_YES
     * @type {Integer (Int32)}
     */
    static YES => 2
}
