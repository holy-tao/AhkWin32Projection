#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class HLFNAMEF extends Win32BitflagEnum {

    /**
     * Native name: HLFNAMEF_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * Native name: HLFNAMEF_TRYCACHE
     * @type {Integer (Int32)}
     */
    static TRYCACHE => 1

    /**
     * Native name: HLFNAMEF_TRYPRETTYTARGET
     * @type {Integer (Int32)}
     */
    static TRYPRETTYTARGET => 2

    /**
     * Native name: HLFNAMEF_TRYFULLTARGET
     * @type {Integer (Int32)}
     */
    static TRYFULLTARGET => 4

    /**
     * Native name: HLFNAMEF_TRYWIN95SHORTCUT
     * @type {Integer (Int32)}
     */
    static TRYWIN95SHORTCUT => 8
}
