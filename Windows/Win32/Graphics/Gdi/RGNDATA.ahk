#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RGNDATAHEADER.ahk" { RGNDATAHEADER }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * The RGNDATA structure contains a header and an array of rectangles that compose a region. The rectangles are sorted top to bottom, left to right. They do not overlap.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-rgndata
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct RGNDATA {
    #StructPack 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-rgndataheader">RGNDATAHEADER</a> structure. The members of this structure specify the type of region (whether it is rectangular or trapezoidal), the number of rectangles that make up the region, the size of the buffer that contains the rectangle structures, and so on.
     */
    rdh : RGNDATAHEADER

    /**
     * Specifies an arbitrary-size buffer that contains the <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structures that make up the region.
     */
    Buffer : CHAR[1]

}
