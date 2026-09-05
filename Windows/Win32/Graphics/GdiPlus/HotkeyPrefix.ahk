#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class HotkeyPrefix extends Win32Enum {

    /**
     * Native name: HotkeyPrefixNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: HotkeyPrefixShow
     * @type {Integer (Int32)}
     */
    static Show => 1

    /**
     * Native name: HotkeyPrefixHide
     * @type {Integer (Int32)}
     */
    static Hide => 2
}
