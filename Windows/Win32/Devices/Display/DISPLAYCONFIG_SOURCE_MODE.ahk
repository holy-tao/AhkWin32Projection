#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DISPLAYCONFIG_PIXELFORMAT.ahk" { DISPLAYCONFIG_PIXELFORMAT }
#Import "..\..\Foundation\POINTL.ahk" { POINTL }

/**
 * The DISPLAYCONFIG_SOURCE_MODE structure represents a point or an offset in a two-dimensional space.
 * @remarks
 * The arrangement of source surfaces on the desktop is controlled by the <b>position</b> member, which specifies the position in desktop coordinates of the upper-left corner of the source surface. The source surface that is positioned at (0, 0) is considered the primary. GDI has strict rules about how the source surfaces can be arranged in the desktop space. For example, there cannot be any gaps between source surfaces, and there can be no overlaps.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setdisplayconfig">SetDisplayConfig</a> function attempts to rearrange source surfaces in order to enforce these layout rules. The caller must make every effort to lay out the source surfaces correctly because  GDI  rearranges the sources in an undefined manner to enforce the layout rules. The resultant layout may not be what the caller wanted to achieve.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-displayconfig_source_mode
 * @namespace Windows.Win32.Devices.Display
 */
export default struct DISPLAYCONFIG_SOURCE_MODE {
    #StructPack 4

    /**
     * The width in pixels of the source mode.
     */
    width : UInt32

    /**
     * The height in pixels of the source mode.
     */
    height : UInt32

    /**
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ne-wingdi-displayconfig_pixelformat">DISPLAYCONFIG_PIXELFORMAT</a> enumeration that specifies the pixel format of the source mode.
     */
    pixelFormat : DISPLAYCONFIG_PIXELFORMAT

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-pointl">POINTL</a> structure that specifies the position in the desktop coordinate space of the  upper-left corner of this source surface. The source surface that is located at (0, 0) is always the primary source surface.
     */
    position : POINTL

}
