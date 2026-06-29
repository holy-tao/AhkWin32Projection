#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_DIRECTDRAW_LOCAL.ahk" { DD_DIRECTDRAW_LOCAL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DDPIXELFORMAT.ahk" { DDPIXELFORMAT }
#Import ".\DD_VIDEOPORT_LOCAL.ahk" { DD_VIDEOPORT_LOCAL }

/**
 * The DD_GETVPORTOUTPUTFORMATDATA structure contains the information required for the driver to return all of the output formats that the video port extensions (VPE) object supports for a given input format.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_getvportoutputformatdata
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_GETVPORTOUTPUTFORMATDATA {
    #StructPack 8

    /**
     * Points to the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_local">DD_DIRECTDRAW_LOCAL</a> structure that is relevant to the current Microsoft DirectDraw process only.
     */
    lpDD : DD_DIRECTDRAW_LOCAL.Ptr

    /**
     * Points to the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_videoport_local">DD_VIDEOPORT_LOCAL</a> structure that represents this VPE object.
     */
    lpVideoPort : DD_VIDEOPORT_LOCAL.Ptr

    dwFlags : UInt32

    /**
     * Points to a <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ksmedia/ns-ksmedia-_ddpixelformat">DDPIXELFORMAT</a> structure that contains an input format supported by the VPE object. This format was returned by <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_getinputformats">DdVideoPortGetInputFormats</a>.
     */
    lpddpfInputFormat : DDPIXELFORMAT.Ptr

    /**
     * Points to an array of DDPIXELFORMAT structures in which the driver should return the output formats that the VPE object supports for the input format specified by <b>lpddpfInputFormat</b>. This member can be <b>NULL</b>.
     */
    lpddpfOutputFormats : DDPIXELFORMAT.Ptr

    /**
     * Specifies the location in which the driver should return the number of output formats that the VPE object supports for the specified input format.
     */
    dwNumFormats : UInt32

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_getoutputformats">DdVideoPortGetOutputFormats</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     */
    ddRVal : HRESULT

    /**
     * Unused: Win95 compatibility
     */
    GetVideoPortInputFormats : IntPtr

}
