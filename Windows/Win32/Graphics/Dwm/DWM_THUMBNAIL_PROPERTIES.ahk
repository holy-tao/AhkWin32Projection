#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Specifies Desktop Window Manager (DWM) thumbnail properties. Used by the DwmUpdateThumbnailProperties function.
 * @see https://learn.microsoft.com/windows/win32/api/dwmapi/ns-dwmapi-dwm_thumbnail_properties
 * @namespace Windows.Win32.Graphics.Dwm
 */
export default struct DWM_THUMBNAIL_PROPERTIES {
    #StructPack 4

    /**
     * A bitwise combination of <a href="https://docs.microsoft.com/windows/desktop/dwm/dwm-tnp-constants">DWM thumbnail constant</a> values that indicates which members of this structure are set.
     */
    dwFlags : UInt32

    /**
     * The area in the destination window where the thumbnail will be rendered.
     */
    rcDestination : RECT

    /**
     * The region of the source window to use as the thumbnail. By default, the entire window is used as the thumbnail.
     */
    rcSource : RECT

    /**
     * The opacity with which to render the thumbnail. 0 is fully transparent while 255 is fully opaque. The default value is 255.
     */
    opacity : Int8

    /**
     * <b>TRUE</b> to make the thumbnail visible; otherwise, <b>FALSE</b>. The default is <b>FALSE</b>.
     */
    fVisible : BOOL

    /**
     * <b>TRUE</b> to use only the thumbnail source's client area; otherwise, <b>FALSE</b>. The default is <b>FALSE</b>.
     */
    fSourceClientAreaOnly : BOOL

}
