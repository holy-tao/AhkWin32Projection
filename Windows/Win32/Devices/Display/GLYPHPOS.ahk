#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GLYPHDEF.ahk" { GLYPHDEF }
#Import "..\..\Foundation\POINTL.ahk" { POINTL }

/**
 * The GLYPHPOS structure is used by GDI to provide a graphics driver with a glyph's description and position.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-glyphpos
 * @namespace Windows.Win32.Devices.Display
 */
export default struct GLYPHPOS {
    #StructPack 8

    /**
     * Handle to the glyph.
     */
    hg : UInt32

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-glyphdef">GLYPHDEF</a> union.
     */
    pgdf : GLYPHDEF.Ptr

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-pointl">POINTL</a> structure that contains the coordinates of the point in device space where the character origin of the glyph should be placed.
     */
    ptl : POINTL

}
