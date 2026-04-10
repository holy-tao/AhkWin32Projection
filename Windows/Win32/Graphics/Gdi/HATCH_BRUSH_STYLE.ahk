#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
class HATCH_BRUSH_STYLE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static HS_BDIAGONAL => 3

    /**
     * @type {Integer (Int32)}
     */
    static HS_CROSS => 4

    /**
     * @type {Integer (Int32)}
     */
    static HS_DIAGCROSS => 5

    /**
     * @type {Integer (Int32)}
     */
    static HS_FDIAGONAL => 2

    /**
     * @type {Integer (Int32)}
     */
    static HS_HORIZONTAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static HS_VERTICAL => 1
}
