#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_DIRECTDRAW_LOCAL.ahk" { DD_DIRECTDRAW_LOCAL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DDPIXELFORMAT.ahk" { DDPIXELFORMAT }
#Import ".\DD_VIDEOPORT_LOCAL.ahk" { DD_VIDEOPORT_LOCAL }

/**
 * The DD_GETVPORTINPUTFORMATDATA structure contains the information required for the driver to return the input formats that the video port extensions (VPE) object can accept.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_getvportinputformatdata
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_GETVPORTINPUTFORMATDATA {
    #StructPack 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_local">DD_DIRECTDRAW_LOCAL</a> structure that is relevant to the current Microsoft DirectDraw process only.
     */
    lpDD : DD_DIRECTDRAW_LOCAL.Ptr

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_videoport_local">DD_VIDEOPORT_LOCAL</a> structure that represents this VPE object.
     */
    lpVideoPort : DD_VIDEOPORT_LOCAL.Ptr

    dwFlags : UInt32

    /**
     * Points to an array of <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ksmedia/ns-ksmedia-_ddpixelformat">DDPIXELFORMAT</a> structures in which the driver should write the pixel formats supported by the VPE object. This member can be <b>NULL</b>.
     */
    lpddpfFormat : DDPIXELFORMAT.Ptr

    /**
     * Specifies the location in which the driver should write the number of formats that the VPE object supports.
     */
    dwNumFormats : UInt32

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_getinputformats">DdVideoPortGetInputFormats</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     */
    ddRVal : HRESULT

    /**
     * Used by the DirectDraw API and should not be filled in by the driver.
     */
    GetVideoPortInputFormats : IntPtr

}
