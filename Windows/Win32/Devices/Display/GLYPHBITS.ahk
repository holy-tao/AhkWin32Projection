#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\POINTL.ahk" { POINTL }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }

/**
 * The GLYPHBITS structure is used to define a glyph bitmap.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-glyphbits
 * @namespace Windows.Win32.Devices.Display
 */
export default struct GLYPHBITS {
    #StructPack 4

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-pointl">POINTL</a> structure that defines the origin of the character in the bitmap.
     */
    ptlOrigin : POINTL

    /**
     * Specifies a SIZEL structure that contains the width and height, in pixels, of the bitmap. A SIZEL structure is identical to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-size">SIZE</a> structure.
     */
    sizlBitmap : SIZE

    /**
     * Is a variable-sized byte array containing a BYTE-aligned bitmap of the glyph. The array must include padding at the end to DWORD-align the entire structure.
     * 
     * GDI will make this request of drivers that have antialiased fonts (see the description of <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvqueryfontcaps">DrvQueryFontCaps</a>). It is possible that a driver may not be able to render a font in a multilevel format. In this case, the driver fails the call and GDI will call the driver again requesting a monochrome realization.
     */
    aj : Int8[1]

}
