#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * Specifies Desktop Window Manager (DWM) thumbnail properties. Used by the DwmUpdateThumbnailProperties function.
 * @see https://docs.microsoft.com/windows/win32/api//dwmapi/ns-dwmapi-dwm_thumbnail_properties
 * @namespace Windows.Win32.Graphics.Dwm
 * @version v4.0.30319
 */
class DWM_THUMBNAIL_PROPERTIES extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * A bitwise combination of <a href="https://docs.microsoft.com/windows/desktop/dwm/dwm-tnp-constants">DWM thumbnail constant</a> values that indicates which members of this structure are set.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The area in the destination window where the thumbnail will be rendered.
     * @type {RECT}
     */
    rcDestination{
        get {
            if(!this.HasProp("__rcDestination"))
                this.__rcDestination := RECT(this.ptr + 8)
            return this.__rcDestination
        }
    }

    /**
     * The region of the source window to use as the thumbnail. By default, the entire window is used as the thumbnail.
     * @type {RECT}
     */
    rcSource{
        get {
            if(!this.HasProp("__rcSource"))
                this.__rcSource := RECT(this.ptr + 24)
            return this.__rcSource
        }
    }

    /**
     * The opacity with which to render the thumbnail. 0 is fully transparent while 255 is fully opaque. The default value is 255.
     * @type {Integer}
     */
    opacity {
        get => NumGet(this, 40, "char")
        set => NumPut("char", value, this, 40)
    }

    /**
     * <b>TRUE</b> to make the thumbnail visible; otherwise, <b>FALSE</b>. The default is <b>FALSE</b>.
     * @type {BOOL}
     */
    fVisible{
        get {
            if(!this.HasProp("__fVisible"))
                this.__fVisible := BOOL(this.ptr + 44)
            return this.__fVisible
        }
    }

    /**
     * <b>TRUE</b> to use only the thumbnail source's client area; otherwise, <b>FALSE</b>. The default is <b>FALSE</b>.
     * @type {BOOL}
     */
    fSourceClientAreaOnly{
        get {
            if(!this.HasProp("__fSourceClientAreaOnly"))
                this.__fSourceClientAreaOnly := BOOL(this.ptr + 48)
            return this.__fSourceClientAreaOnly
        }
    }
}
