#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DD_GETVPORTBANDWIDTHDATA structure contains the bandwidth information for any specified format.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_getvportbandwidthdata
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_GETVPORTBANDWIDTHDATA extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_local">DD_DIRECTDRAW_LOCAL</a> structure that is relevant to the current Microsoft DirectDraw process only.
     * @type {Pointer<TypeHandle>}
     */
    lpDD {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_videoport_local">DD_VIDEOPORT_LOCAL</a> structure that represents this <a href="https://docs.microsoft.com/windows-hardware/drivers/">video port extensions (VPE)</a> object.
     * @type {Pointer<DD_VIDEOPORT_LOCAL>}
     */
    lpVideoPort {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Points to a <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ksmedia/ns-ksmedia-_ddpixelformat">DDPIXELFORMAT</a> structure that describes the output pixel format for which the driver should return bandwidth information.
     * @type {Pointer<DDPIXELFORMAT>}
     */
    lpddpfFormat {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * 
     * @type {Integer}
     */
    dwWidth {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Specify the dimensions of the source overlay or of the video data in pixels depending on the value of <b>dwFlags</b>. These values are calculated by the client based on the VPE object's capabilities returned in a prior call to <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_getbandwidth">DdVideoPortGetBandwidth</a>.
     * @type {Integer}
     */
    dwHeight {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Specifies the flags indicating how the driver should interpret the <b>dwWidth</b> and <b>dwHeight</b> members. This member can be one of the values listed in the following table.
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * DDVPB_OVERLAY
     * 
     * </td>
     * <td>
     * The <b>dwWidth</b> and <b>dwHeight</b> members specify the size in pixels of the source overlay surface. This flag indicates that the VPE object is dependent on the overlay source size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDVPB_TYPE
     * 
     * </td>
     * <td>
     * The <b>dwWidth</b> and <b>dwHeight</b> members are not set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * DDVPB_VIDEOPORT
     * 
     * </td>
     * <td>
     * The <b>dwWidth</b> and <b>dwHeight</b> members specify the prescale size of the video data that the VPE object writes to the frame buffer. This flag indicates that the VPE object is dependent on the overlay stretch factor.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Points to the <a href="https://docs.microsoft.com/windows/desktop/api/dvp/ns-dvp-ddvideoportbandwidth">DDVIDEOPORTBANDWIDTH</a> structure in which the driver should write the bandwidth parameters.
     * @type {Pointer<DDVIDEOPORTBANDWIDTH>}
     */
    lpBandwidth {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_getbandwidth">DdVideoPortGetBandwidth</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     * @type {HRESULT}
     */
    ddRVal {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * Used by the DirectDraw API and should not be filled in by the driver.
     * @type {Pointer<Void>}
     */
    GetVideoPortBandwidth {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
