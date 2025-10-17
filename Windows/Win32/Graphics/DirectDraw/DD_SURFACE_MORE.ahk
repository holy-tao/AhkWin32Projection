#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DDSCAPSEX.ahk

/**
 * The DD_SURFACE_MORE structure contains additional local data for each individual DirectDrawSurface object.
 * @see https://docs.microsoft.com/windows/win32/api//ddrawint/ns-ddrawint-dd_surface_more
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_SURFACE_MORE extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Contains the number of mipmap levels in the chain.
     * @type {Integer}
     */
    dwMipMapCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_videoport_local">DD_VIDEOPORT_LOCAL</a> structure of the <a href="https://docs.microsoft.com/windows-hardware/drivers/">video port extensions (VPE)</a> object currently writing data to this surface.
     * @type {Pointer<DD_VIDEOPORT_LOCAL>}
     */
    lpVideoPort {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * 
     * @type {Integer}
     */
    dwOverlayFlags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Specifies a DDSCAPSEX structure that is used to expose extended surface capabilities. A DDSCAPSEX structure is the same as a <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff550292(v=vs.85)">DDSCAPS2</a> structure without the <b>dwCaps</b> member.
     * @type {DDSCAPSEX}
     */
    ddsCapsEx{
        get {
            if(!this.HasProp("__ddsCapsEx"))
                this.__ddsCapsEx := DDSCAPSEX(24, this)
            return this.__ddsCapsEx
        }
    }

    /**
     * Specifies a cookie for <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_createsurfaceex">D3dCreateSurfaceEx</a> so that it can associate a texture handle with the surface.
     * @type {Integer}
     */
    dwSurfaceHandle {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}
