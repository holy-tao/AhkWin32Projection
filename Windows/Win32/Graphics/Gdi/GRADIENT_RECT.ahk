#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The GRADIENT_RECT structure specifies the index of two vertices in the pVertex array in the GradientFill function. These two vertices form the upper-left and lower-right boundaries of a rectangle.
 * @remarks
 * 
 * The <b>GRADIENT_RECT</b> structure specifies the values of the <i>pVertex</i> array that are used when the <i>dwMode</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-gradientfill">GradientFill</a> function is GRADIENT_FILL_RECT_H or GRADIENT_FILL_RECT_V. For related <b>GradientFill</b> structures, see <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-gradient_triangle">GRADIENT_TRIANGLE</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-trivertex">TRIVERTEX</a>.
 * 
 * The following images shows examples of a rectangle with a gradient fill - one in horizontal mode, the other in vertical mode.
 * 
 * <img alt="Illustration of a rectangle that shades from dark on the left side to light on the right side" border="0" src="images/GradientFillRectangle.png"/>
 * <img alt="Illustration of a rectangle that shades from dark on the top to light on the bottom" border="0" src="images/GradientFillRectangle2.png"/>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-gradient_rect
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class GRADIENT_RECT extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The upper-left corner of a rectangle.
     * @type {Integer}
     */
    UpperLeft {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The lower-right corner of a rectangle.
     * @type {Integer}
     */
    LowerRight {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
