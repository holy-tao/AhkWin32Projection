#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DDCOLORKEY.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * The DD_SURFACE_LOCAL structure contains surface-related data that is unique to an individual surface object.
 * @see https://docs.microsoft.com/windows/win32/api//ddrawint/ns-ddrawint-dd_surface_local
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_SURFACE_LOCAL extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * Points to the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_surface_global">DD_SURFACE_GLOBAL</a> structure containing surface data that is shared globally with multiple surfaces.
     * @type {Pointer<DD_SURFACE_GLOBAL>}
     */
    lpGbl {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies a <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff550286(v=vs.85)">DDSCAPS</a> structure that describes the capabilities of the surface.
     * @type {Integer}
     */
    ddsCaps {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Reserved for use by the display driver.
     * @type {Pointer}
     */
    dwReserved1 {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {DDCOLORKEY}
     */
    ddckCKSrcOverlay{
        get {
            if(!this.HasProp("__ddckCKSrcOverlay"))
                this.__ddckCKSrcOverlay := DDCOLORKEY(this.ptr + 24)
            return this.__ddckCKSrcOverlay
        }
    }

    /**
     * @type {DDCOLORKEY}
     */
    ddckCKSrcBlt{
        get {
            if(!this.HasProp("__ddckCKSrcBlt"))
                this.__ddckCKSrcBlt := DDCOLORKEY(this.ptr + 24)
            return this.__ddckCKSrcBlt
        }
    }

    /**
     * @type {DDCOLORKEY}
     */
    ddckCKDestOverlay{
        get {
            if(!this.HasProp("__ddckCKDestOverlay"))
                this.__ddckCKDestOverlay := DDCOLORKEY(this.ptr + 32)
            return this.__ddckCKDestOverlay
        }
    }

    /**
     * @type {DDCOLORKEY}
     */
    ddckCKDestBlt{
        get {
            if(!this.HasProp("__ddckCKDestBlt"))
                this.__ddckCKDestBlt := DDCOLORKEY(this.ptr + 32)
            return this.__ddckCKDestBlt
        }
    }

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_surface_more">DD_SURFACE_MORE</a> structure that contains additional local surface data.
     * @type {Pointer<DD_SURFACE_MORE>}
     */
    lpSurfMore {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_attachlist">DD_ATTACHLIST</a> structure that contains the list of surfaces to which this surface attached.
     * @type {Pointer<DD_ATTACHLIST>}
     */
    lpAttachList {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Points to a DD_ATTACHLIST structure that contains the list of surfaces attached to this surface.
     * @type {Pointer<DD_ATTACHLIST>}
     */
    lpAttachListFrom {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Reserved for system use and should be ignored by the driver.
     * @type {RECT}
     */
    rcOverlaySrc{
        get {
            if(!this.HasProp("__rcOverlaySrc"))
                this.__rcOverlaySrc := RECT(this.ptr + 64)
            return this.__rcOverlaySrc
        }
    }
}
