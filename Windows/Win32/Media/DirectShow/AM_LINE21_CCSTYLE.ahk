#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class AM_LINE21_CCSTYLE extends Win32Enum {

    /**
     * Native name: AM_L21_CCSTYLE_None
     * @type {Integer (Int32)}
     */
    static L21_CCSTYLE_None => 0

    /**
     * Native name: AM_L21_CCSTYLE_PopOn
     * @type {Integer (Int32)}
     */
    static L21_CCSTYLE_PopOn => 1

    /**
     * Native name: AM_L21_CCSTYLE_PaintOn
     * @type {Integer (Int32)}
     */
    static L21_CCSTYLE_PaintOn => 2

    /**
     * Native name: AM_L21_CCSTYLE_RollUp
     * @type {Integer (Int32)}
     */
    static L21_CCSTYLE_RollUp => 3
}
