#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * In this mode, two endpoints describe a rectangle. The rectangle is defined to have a constant color (specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-trivertex">TRIVERTEX</a> structure) for the left and right edges. GDI interpolates the color from the left to right edge and fills the interior.
 * @see https://learn.microsoft.com/windows/win32/api//content/wingdi/ns-wingdi-emrgradientfill
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class GRADIENT_FILL extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static GRADIENT_FILL_RECT_H => 0

    /**
     * @type {Integer (UInt32)}
     */
    static GRADIENT_FILL_RECT_V => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GRADIENT_FILL_TRIANGLE => 2
}
