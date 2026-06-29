#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FIXED.ahk" { FIXED }

/**
 * The POINTFX structure contains the coordinates of points that describe the outline of a character in a TrueType font.
 * @remarks
 * The <b>POINTFX</b> structure is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-ttpolycurve">TTPOLYCURVE</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-ttpolygonheader">TTPOLYGONHEADER</a> structures. Values in the <b>POINTFX</b> structure are specified in device units.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-pointfx
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct POINTFX {
    #StructPack 2

    /**
     * The x-component of a point on the outline of a TrueType character.
     */
    x : FIXED

    /**
     * The y-component of a point on the outline of a TrueType character.
     */
    y : FIXED

}
