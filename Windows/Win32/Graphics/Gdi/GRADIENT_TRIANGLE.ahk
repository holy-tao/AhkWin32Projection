#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The GRADIENT_TRIANGLE structure specifies the index of three vertices in the pVertex array in the GradientFill function. These three vertices form one triangle.
 * @remarks
 * 
  * The <b>GRADIENT_TRIANGLE</b> structure specifies the values in the <i>pVertex</i> array that are used when the <i>dwMode</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-gradientfill">GradientFill</a> function is GRADIENT_FILL_TRIANGLE. For related <b>GradientFill</b> structures, see <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-gradient_rect">GRADIENT_RECT</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-trivertex">TRIVERTEX</a>.
  * 
  * The following image shows an example of a triangle with a gradient fill.
  * 
  * <img alt="Illustration of a triangle that fills from orange at the top point to magenta on the bottom line " border="0" src="images/GradientFillTriangle.png"/>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-gradient_triangle
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class GRADIENT_TRIANGLE extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * The first point of the triangle where sides intersect.
     * @type {Integer}
     */
    Vertex1 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The second point of the triangle where sides intersect.
     * @type {Integer}
     */
    Vertex2 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The third point of the triangle where sides intersect.
     * @type {Integer}
     */
    Vertex3 {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
