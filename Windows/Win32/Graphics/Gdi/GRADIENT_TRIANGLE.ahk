#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The GRADIENT_TRIANGLE structure specifies the index of three vertices in the pVertex array in the GradientFill function. These three vertices form one triangle.
 * @remarks
 * The <b>GRADIENT_TRIANGLE</b> structure specifies the values in the <i>pVertex</i> array that are used when the <i>dwMode</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-gradientfill">GradientFill</a> function is GRADIENT_FILL_TRIANGLE. For related <b>GradientFill</b> structures, see <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-gradient_rect">GRADIENT_RECT</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-trivertex">TRIVERTEX</a>.
 * 
 * The following image shows an example of a triangle with a gradient fill.
 * 
 * <img alt="Illustration of a triangle that fills from orange at the top point to magenta on the bottom line " border="0" src="images/GradientFillTriangle.png"/>
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-gradient_triangle
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct GRADIENT_TRIANGLE {
    #StructPack 4

    /**
     * The first point of the triangle where sides intersect.
     */
    Vertex1 : UInt32

    /**
     * The second point of the triangle where sides intersect.
     */
    Vertex2 : UInt32

    /**
     * The third point of the triangle where sides intersect.
     */
    Vertex3 : UInt32

}
