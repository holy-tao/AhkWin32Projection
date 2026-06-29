#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECTL.ahk" { RECTL }
#Import "..\..\Foundation\POINTL.ahk" { POINTL }

/**
 * The DISPLAYCONFIG_DESKTOP_IMAGE_INFO structure contains information about the image displayed on the desktop.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-displayconfig_desktop_image_info
 * @namespace Windows.Win32.Devices.Display
 */
export default struct DISPLAYCONFIG_DESKTOP_IMAGE_INFO {
    #StructPack 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-pointl">POINTL</a> structure that specifies the size of the VidPn source surface that is being displayed on the monitor.
     */
    PathSourceSize : POINTL

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rectl">RECTL</a> structure that defines where the desktop image will be positioned within path source. 	Region must be completely inside the bounds of the path source size.
     */
    DesktopImageRegion : RECTL

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rectl">RECTL</a> structure that defines which part of the desktop image for this clone group will be displayed on this path. This currently must be set to the desktop size.
     */
    DesktopImageClip : RECTL

}
