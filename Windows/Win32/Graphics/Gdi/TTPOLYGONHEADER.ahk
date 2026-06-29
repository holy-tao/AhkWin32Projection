#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FIXED.ahk" { FIXED }
#Import ".\POINTFX.ahk" { POINTFX }

/**
 * The TTPOLYGONHEADER structure specifies the starting position and type of a contour in a TrueType character outline.
 * @remarks
 * Each <b>TTPOLYGONHEADER</b> structure is followed by one or more <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-ttpolycurve">TTPOLYCURVE</a> structures.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-ttpolygonheader
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct TTPOLYGONHEADER {
    #StructPack 4

    /**
     * The number of bytes required by the <b>TTPOLYGONHEADER</b> structure and <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-ttpolycurve">TTPOLYCURVE</a> structure or structures required to describe the contour of the character.
     */
    cb : UInt32

    /**
     * The type of character outline returned. Currently, this value must be TT_POLYGON_TYPE.
     */
    dwType : UInt32

    /**
     * The starting point of the contour in the character outline.
     */
    pfxStart : POINTFX

}
