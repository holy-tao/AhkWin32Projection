#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\POINTL.ahk

/**
 * The DISPLAYCONFIG_SOURCE_MODE structure represents a point or an offset in a two-dimensional space.
 * @remarks
 * The arrangement of source surfaces on the desktop is controlled by the <b>position</b> member, which specifies the position in desktop coordinates of the upper-left corner of the source surface. The source surface that is positioned at (0, 0) is considered the primary. GDI has strict rules about how the source surfaces can be arranged in the desktop space. For example, there cannot be any gaps between source surfaces, and there can be no overlaps.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setdisplayconfig">SetDisplayConfig</a> function attempts to rearrange source surfaces in order to enforce these layout rules. The caller must make every effort to lay out the source surfaces correctly because  GDI  rearranges the sources in an undefined manner to enforce the layout rules. The resultant layout may not be what the caller wanted to achieve.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-displayconfig_source_mode
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class DISPLAYCONFIG_SOURCE_MODE extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * The width in pixels of the source mode.
     * @type {Integer}
     */
    width {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The height in pixels of the source mode.
     * @type {Integer}
     */
    height {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ne-wingdi-displayconfig_pixelformat">DISPLAYCONFIG_PIXELFORMAT</a> enumeration that specifies the pixel format of the source mode.
     * @type {Integer}
     */
    pixelFormat {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-pointl">POINTL</a> structure that specifies the position in the desktop coordinate space of the  upper-left corner of this source surface. The source surface that is located at (0, 0) is always the primary source surface.
     * @type {POINTL}
     */
    position{
        get {
            if(!this.HasProp("__position"))
                this.__position := POINTL(12, this)
            return this.__position
        }
    }
}
