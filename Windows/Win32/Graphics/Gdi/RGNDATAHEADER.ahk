#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * The RGNDATAHEADER structure describes the data returned by the GetRegionData function.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-rgndataheader
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct RGNDATAHEADER {
    #StructPack 4

    /**
     * The size, in bytes, of the header.
     */
    dwSize : UInt32

    /**
     * The type of region. This value must be RDH_RECTANGLES.
     */
    iType : UInt32

    /**
     * The number of rectangles that make up the region.
     */
    nCount : UInt32

    /**
     * The size of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-rgndata">RGNDATA</a> buffer required to receive the <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structures that make up the region. If the size is not known, this member can be zero.
     */
    nRgnSize : UInt32

    /**
     * A bounding rectangle for the region in logical units.
     */
    rcBound : RECT

}
