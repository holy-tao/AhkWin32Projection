#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDSCAPSEX.ahk" { DDSCAPSEX }
#Import ".\DD_VIDEOPORT_LOCAL.ahk" { DD_VIDEOPORT_LOCAL }

/**
 * The DD_SURFACE_MORE structure contains additional local data for each individual DirectDrawSurface object.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_surface_more
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_SURFACE_MORE {
    #StructPack 8

    /**
     * Contains the number of mipmap levels in the chain.
     */
    dwMipMapCount : UInt32

    __lpVideoPort_ptr : IntPtr
    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_videoport_local">DD_VIDEOPORT_LOCAL</a> structure of the <a href="https://docs.microsoft.com/windows-hardware/drivers/">video port extensions (VPE)</a> object currently writing data to this surface.
     */
    lpVideoPort {
        get => (addr := this.__lpVideoPort_ptr) ? DD_VIDEOPORT_LOCAL.At(addr) : unset
        set => this.__lpVideoPort_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    dwOverlayFlags : UInt32

    /**
     * Specifies a DDSCAPSEX structure that is used to expose extended surface capabilities. A DDSCAPSEX structure is the same as a <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff550292(v=vs.85)">DDSCAPS2</a> structure without the <b>dwCaps</b> member.
     */
    ddsCapsEx : DDSCAPSEX

    /**
     * Specifies a cookie for <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_createsurfaceex">D3dCreateSurfaceEx</a> so that it can associate a texture handle with the surface.
     */
    dwSurfaceHandle : UInt32

}
