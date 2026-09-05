#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
class PARAFORMAT_BORDERS extends Win32BitflagEnum {

    /**
     * Native name: PARAFORMAT_BORDERS_LEFT
     * @type {Integer (UInt16)}
     */
    static LEFT => 1

    /**
     * Native name: PARAFORMAT_BORDERS_RIGHT
     * @type {Integer (UInt16)}
     */
    static RIGHT => 2

    /**
     * Native name: PARAFORMAT_BORDERS_TOP
     * @type {Integer (UInt16)}
     */
    static TOP => 4

    /**
     * Native name: PARAFORMAT_BORDERS_BOTTOM
     * @type {Integer (UInt16)}
     */
    static BOTTOM => 8

    /**
     * Native name: PARAFORMAT_BORDERS_INSIDE
     * @type {Integer (UInt16)}
     */
    static INSIDE => 16

    /**
     * Native name: PARAFORMAT_BORDERS_OUTSIDE
     * @type {Integer (UInt16)}
     */
    static OUTSIDE => 32

    /**
     * Native name: PARAFORMAT_BORDERS_AUTOCOLOR
     * @type {Integer (UInt16)}
     */
    static AUTOCOLOR => 64
}
