#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class PARAFORMAT_SHADING_STYLE extends Win32Enum{

    /**
     * @type {Integer (UInt16)}
     */
    static PARAFORMAT_SHADING_STYLE_NONE => 0

    /**
     * @type {Integer (UInt16)}
     */
    static PARAFORMAT_SHADING_STYLE_DARK_HORIZ => 1

    /**
     * @type {Integer (UInt16)}
     */
    static PARAFORMAT_SHADING_STYLE_DARK_VERT => 2

    /**
     * @type {Integer (UInt16)}
     */
    static PARAFORMAT_SHADING_STYLE_DARK_DOWN_DIAG => 3

    /**
     * @type {Integer (UInt16)}
     */
    static PARAFORMAT_SHADING_STYLE_DARK_UP_DIAG => 4

    /**
     * @type {Integer (UInt16)}
     */
    static PARAFORMAT_SHADING_STYLE_DARK_GRID => 5

    /**
     * @type {Integer (UInt16)}
     */
    static PARAFORMAT_SHADING_STYLE_DARK_TRELLIS => 6

    /**
     * @type {Integer (UInt16)}
     */
    static PARAFORMAT_SHADING_STYLE_LIGHT_HORZ => 7

    /**
     * @type {Integer (UInt16)}
     */
    static PARAFORMAT_SHADING_STYLE_LIGHT_VERT => 8

    /**
     * @type {Integer (UInt16)}
     */
    static PARAFORMAT_SHADING_STYLE_LIGHT_DOWN_DIAG => 9

    /**
     * @type {Integer (UInt16)}
     */
    static PARAFORMAT_SHADING_STYLE_LIGHT_UP_DIAG => 10

    /**
     * @type {Integer (UInt16)}
     */
    static PARAFORMAT_SHADING_STYLE_LIGHT_GRID => 11

    /**
     * @type {Integer (UInt16)}
     */
    static PARAFORMAT_SHADING_STYLE_LIGHT_TRELLIS => 12
}
