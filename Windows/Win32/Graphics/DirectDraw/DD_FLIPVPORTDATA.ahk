#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_DIRECTDRAW_LOCAL.ahk" { DD_DIRECTDRAW_LOCAL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DD_SURFACE_LOCAL.ahk" { DD_SURFACE_LOCAL }
#Import ".\DD_VIDEOPORT_LOCAL.ahk" { DD_VIDEOPORT_LOCAL }

/**
 * The DD_FLIPVPORTDATA structure contains the information necessary for the video port extensions (VPE) object to perform a flip.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_flipvportdata
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_FLIPVPORTDATA {
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
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_surface_local">DD_SURFACE_LOCAL</a> structure for the current surface; that is, the surface on which data is currently being written.
     */
    lpSurfCurr : DD_SURFACE_LOCAL.Ptr

    /**
     * Points to a DD_SURFACE_LOCAL structure for the target surface; that is, the surface to which the driver should flip.
     */
    lpSurfTarg : DD_SURFACE_LOCAL.Ptr

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_flip">DdVideoPortFlip</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     */
    ddRVal : HRESULT

    /**
     * Used by the DirectDraw API and should not be filled in by the driver.
     */
    FlipVideoPort : IntPtr

}
