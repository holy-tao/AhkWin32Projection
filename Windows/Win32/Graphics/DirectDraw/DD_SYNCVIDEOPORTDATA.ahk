#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_DIRECTDRAW_LOCAL.ahk" { DD_DIRECTDRAW_LOCAL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DD_VIDEOPORT_LOCAL.ahk" { DD_VIDEOPORT_LOCAL }

/**
 * The DD_SYNCVIDEOPORTDATA structure contains the video port extensions (VPE) object information.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_syncvideoportdata
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_SYNCVIDEOPORTDATA {
    #StructPack 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_local">DD_DIRECTDRAW_LOCAL</a> structure that is relevant to the current Microsoft DirectDraw process only.
     */
    lpDD : DD_DIRECTDRAW_LOCAL.Ptr

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_videoport_local">DD_VIDEOPORT_LOCAL</a> structure that describes the hardware video port with which to sync.
     */
    lpVideoPort : DD_VIDEOPORT_LOCAL.Ptr

    /**
     * Contains the byte offset from the top left corner of the surface to the top left corner of where the VPE object writes its data. This value is only used by the video miniport driver. This member must contain data that is filled in by the driver.
     */
    dwOriginOffset : UInt32

    /**
     * Contains the height in pixels of the VPE object data. By default, this is twice the field height when interleaved, but the driver can change this if it needs to. This value is used only by the video miniport driver. This member can be modified by the driver, but does not need to be.
     */
    dwHeight : UInt32

    /**
     * Contains the number of lines in the <a href="https://docs.microsoft.com/windows-hardware/drivers/">VBI</a> region. This value is used only by the video miniport driver. This member can be modified by the driver, but does not need to be.
     */
    dwVBIHeight : UInt32

    /**
     * Is reserved for use by the display driver.
     */
    dwDriverReserved1 : UInt32

    /**
     * Reserved for use by the display driver.
     */
    dwDriverReserved2 : UInt32

    /**
     * Reserved for use by the display driver.
     */
    dwDriverReserved3 : UInt32

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_kernelcb_syncvideoport">DdSyncVideoPortData</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     */
    ddRVal : HRESULT

}
