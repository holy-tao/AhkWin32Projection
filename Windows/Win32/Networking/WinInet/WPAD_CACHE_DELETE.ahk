#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class WPAD_CACHE_DELETE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WPAD_CACHE_DELETE_CURRENT => 0

    /**
     * @type {Integer (Int32)}
     */
    static WPAD_CACHE_DELETE_ALL => 1
}
