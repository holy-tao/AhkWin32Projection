#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_SURFACE_INT.ahk" { DD_SURFACE_INT }
#Import ".\DDVIDEOPORTCONNECT.ahk" { DDVIDEOPORTCONNECT }
#Import ".\DD_DIRECTDRAW_LOCAL.ahk" { DD_DIRECTDRAW_LOCAL }
#Import ".\DDVIDEOPORTINFO.ahk" { DDVIDEOPORTINFO }
#Import ".\DDPIXELFORMAT.ahk" { DDPIXELFORMAT }
#Import ".\DDVIDEOPORTDESC.ahk" { DDVIDEOPORTDESC }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * The DD_VIDEOPORT_LOCAL structure contains video port extensions (VPE)-related data that is unique to an individual Microsoft DirectDraw VPE object.
 * @remarks
 * This structure is initialized and filled in by DirectDraw. Except for the <b>dwReserved1</b>, <b>dwReserved2</b>, and <b>dwReserved3</b> members, the driver must not modify any other members of the DD_VIDEOPORT_LOCAL structure.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_videoport_local
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_VIDEOPORT_LOCAL {
    #StructPack 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_local">DD_DIRECTDRAW_LOCAL</a> structure that is relevant to the current DirectDraw process only.
     */
    lpDD : DD_DIRECTDRAW_LOCAL.Ptr

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/dvp/ns-dvp-ddvideoportdesc">DDVIDEOPORTDESC</a> structure that describes the VPE object.
     */
    ddvpDesc : DDVIDEOPORTDESC

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/dvp/ns-dvp-ddvideoportinfo">DDVIDEOPORTINFO</a> structure that describes the transfer of video data to a surface.
     */
    ddvpInfo : DDVIDEOPORTINFO

    __lpSurface_ptr : IntPtr
    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_surface_int">DD_SURFACE_INT</a> structure for the surface receiving the video data.
     */
    lpSurface {
        get => (addr := this.__lpSurface_ptr) ? DD_SURFACE_INT.At(addr) : unset
        set => this.__lpSurface_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    __lpVBISurface_ptr : IntPtr
    /**
     * Points to a DD_SURFACE_INT structure for the surface receiving the <a href="https://docs.microsoft.com/windows-hardware/drivers/">VBI</a> data.
     */
    lpVBISurface {
        get => (addr := this.__lpVBISurface_ptr) ? DD_SURFACE_INT.At(addr) : unset
        set => this.__lpVBISurface_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    /**
     * Specifies the number of current autoflip surfaces.
     */
    dwNumAutoflip : UInt32

    /**
     * Specifies the number of VBI surfaces currently being autoflipped.
     */
    dwNumVBIAutoflip : UInt32

    /**
     * Reserved for use by the display driver.
     */
    dwReserved1 : IntPtr

    /**
     * Reserved for use by the display driver.
     */
    dwReserved2 : IntPtr

    /**
     * Reserved for use by the display driver.
     */
    dwReserved3 : IntPtr

}
