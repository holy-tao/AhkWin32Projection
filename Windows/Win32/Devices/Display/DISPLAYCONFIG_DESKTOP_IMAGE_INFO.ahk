#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\POINTL.ahk
#Include ..\..\Foundation\RECTL.ahk

/**
 * The DISPLAYCONFIG_DESKTOP_IMAGE_INFO structure contains information about the image displayed on the desktop.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-displayconfig_desktop_image_info
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class DISPLAYCONFIG_DESKTOP_IMAGE_INFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-pointl">POINTL</a> structure that specifies the size of the VidPn source surface that is being displayed on the monitor.
     * @type {POINTL}
     */
    PathSourceSize{
        get {
            if(!this.HasProp("__PathSourceSize"))
                this.__PathSourceSize := POINTL(this.ptr + 0)
            return this.__PathSourceSize
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rectl">RECTL</a> structure that defines where the desktop image will be positioned within path source. 	Region must be completely inside the bounds of the path source size.
     * @type {RECTL}
     */
    DesktopImageRegion{
        get {
            if(!this.HasProp("__DesktopImageRegion"))
                this.__DesktopImageRegion := RECTL(this.ptr + 8)
            return this.__DesktopImageRegion
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rectl">RECTL</a> structure that defines which part of the desktop image for this clone group will be displayed on this path. This currently must be set to the desktop size.
     * @type {RECTL}
     */
    DesktopImageClip{
        get {
            if(!this.HasProp("__DesktopImageClip"))
                this.__DesktopImageClip := RECTL(this.ptr + 24)
            return this.__DesktopImageClip
        }
    }
}
