#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_DIRECTDRAW_LOCAL.ahk" { DD_DIRECTDRAW_LOCAL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DD_SURFACE_INT.ahk" { DD_SURFACE_INT }
#Import ".\DDVIDEOPORTINFO.ahk" { DDVIDEOPORTINFO }
#Import ".\DD_VIDEOPORT_LOCAL.ahk" { DD_VIDEOPORT_LOCAL }

/**
 * The DD_UPDATEVPORTDATA structure contains the information required to start, stop, and change the video port extensions (VPE) object.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_updatevportdata
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_UPDATEVPORTDATA {
    #StructPack 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_local">DD_DIRECTDRAW_LOCAL</a> structure that is relevant to the current Microsoft DirectDraw process only.
     */
    lpDD : DD_DIRECTDRAW_LOCAL.Ptr

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_videoport_local">DD_VIDEOPORT_LOCAL</a> structure that represents this VPE object.
     */
    lpVideoPort : DD_VIDEOPORT_LOCAL.Ptr

    /**
     * Points to an array of <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_surface_int">DD_SURFACE_INT</a> structures that represent regular video surfaces. This member can be <b>NULL</b>.
     */
    lplpDDSurface : IntPtr

    /**
     * Points to an array of DD_SURFACE_INT structures that represent <a href="https://docs.microsoft.com/windows-hardware/drivers/">VBI</a> surfaces. This member can be <b>NULL</b>.
     */
    lplpDDVBISurface : IntPtr

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/dvp/ns-dvp-ddvideoportinfo">DDVIDEOPORTINFO</a> structure that describes how the VPE object should transfer video data to a surface. This member can be <b>NULL</b> when <b>dwFlags</b> is DDRAWI_VPORTSTOP.
     */
    lpVideoInfo : DDVIDEOPORTINFO.Ptr

    dwFlags : UInt32

    /**
     * Specifies the number of surfaces in the list to which <b>lplpDDSurface</b> points. If this member is greater than 1, <b>lplpDDSurface</b> is an array of surface structures to accommodate autoflipping.
     */
    dwNumAutoflip : UInt32

    /**
     * Specifies the number of surfaces in the list to which <b>lplpDDVBISurface</b> points. If this member is greater than 1, <b>lplpDDVBISurface</b> is an array of surface structures to accommodate autoflipping of <a href="https://docs.microsoft.com/windows-hardware/drivers/">VBI</a> data.
     */
    dwNumVBIAutoflip : UInt32

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_update">DdVideoPortUpdate</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     */
    ddRVal : HRESULT

    /**
     * Used by the DirectDraw API and should not be filled in by the driver.
     */
    UpdateVideoPort : IntPtr

}
