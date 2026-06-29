#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FIXED.ahk" { FIXED }
#Import ".\POINTFX.ahk" { POINTFX }

/**
 * The TTPOLYCURVE structure contains information about a curve in the outline of a TrueType character.
 * @remarks
 * When an application calls the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-getglyphoutlinea">GetGlyphOutline</a> function, a glyph outline for a TrueType character is returned in a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-ttpolygonheader">TTPOLYGONHEADER</a> structure, followed by as many <b>TTPOLYCURVE</b> structures as are required to describe the glyph. All points are returned as <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-pointfx">POINTFX</a> structures and represent absolute positions, not relative moves. The starting point specified by the <b>pfxStart</b> member of the <b>TTPOLYGONHEADER</b> structure is the point at which the outline for a contour begins. The <b>TTPOLYCURVE</b> structures that follow can be either polyline records or spline records.
 * 
 * Polyline records are a series of points; lines drawn between the points describe the outline of the character. Spline records represent the quadratic curves (that is, quadratic b-splines) used by TrueType.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-ttpolycurve
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct TTPOLYCURVE {
    #StructPack 2

    wType : UInt16

    /**
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-pointfx">POINTFX</a> structures in the array.
     */
    cpfx : UInt16

    /**
     * Specifies an array of <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-pointfx">POINTFX</a> structures that define the polyline or Bézier spline.
     */
    apfx : POINTFX[1]

}
