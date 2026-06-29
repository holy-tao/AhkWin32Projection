#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_DIRECTDRAW_LOCAL.ahk" { DD_DIRECTDRAW_LOCAL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The DD_GETVPORTFLIPSTATUSDATA structure contains the flip status information for the specified surface.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_getvportflipstatusdata
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_GETVPORTFLIPSTATUSDATA {
    #StructPack 8

    /**
     * Points to the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_local">DD_DIRECTDRAW_LOCAL</a> structure that is relevant to the current Microsoft DirectDraw process only.
     */
    lpDD : DD_DIRECTDRAW_LOCAL.Ptr

    /**
     * Points to the surface for which the flip status information is required.
     */
    fpSurface : IntPtr

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_getflipstatus">DdVideoPortGetFlipStatus</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     */
    ddRVal : HRESULT

    /**
     * Used by the DirectDraw API and should not be filled in by the driver.
     */
    GetVideoPortFlipStatus : IntPtr

}
