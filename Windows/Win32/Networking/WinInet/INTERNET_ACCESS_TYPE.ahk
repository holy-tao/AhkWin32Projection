#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
class INTERNET_ACCESS_TYPE extends Win32Enum {

    /**
     * Native name: INTERNET_OPEN_TYPE_DIRECT
     * @type {Integer (UInt32)}
     */
    static OPEN_TYPE_DIRECT => 1

    /**
     * Native name: INTERNET_OPEN_TYPE_PRECONFIG
     * @type {Integer (UInt32)}
     */
    static OPEN_TYPE_PRECONFIG => 0

    /**
     * Native name: INTERNET_OPEN_TYPE_PROXY
     * @type {Integer (UInt32)}
     */
    static OPEN_TYPE_PROXY => 3
}
