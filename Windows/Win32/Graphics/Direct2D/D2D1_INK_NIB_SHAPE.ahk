#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the appearance of the ink nib (pen tip) as part of a D2D1_INK_STYLE_PROPERTIES structure.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/ne-d2d1_3-d2d1_ink_nib_shape
 * @namespace Windows.Win32.Graphics.Direct2D
 */
class D2D1_INK_NIB_SHAPE extends Win32Enum {

    /**
     * The pen tip is circular.
     * Native name: D2D1_INK_NIB_SHAPE_ROUND
     * @type {Integer (Int32)}
     */
    static ROUND => 0

    /**
     * The pen tip is square.
     * Native name: D2D1_INK_NIB_SHAPE_SQUARE
     * @type {Integer (Int32)}
     */
    static SQUARE => 1
}
