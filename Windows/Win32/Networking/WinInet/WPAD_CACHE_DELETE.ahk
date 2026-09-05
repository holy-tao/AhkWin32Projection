#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
class WPAD_CACHE_DELETE extends Win32Enum {

    /**
     * Native name: WPAD_CACHE_DELETE_CURRENT
     * @type {Integer (Int32)}
     */
    static CURRENT => 0

    /**
     * Native name: WPAD_CACHE_DELETE_ALL
     * @type {Integer (Int32)}
     */
    static ALL => 1
}
