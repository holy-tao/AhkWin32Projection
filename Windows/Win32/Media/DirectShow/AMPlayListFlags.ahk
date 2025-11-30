#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AMPlayListFlags extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static AMPLAYLIST_STARTINSCANMODE => 1

    /**
     * @type {Integer (Int32)}
     */
    static AMPLAYLIST_FORCEBANNER => 2
}
