#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DD_SYNCVIDEOPORTDATA structure contains the video port extensions (VPE) object information.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_syncvideoportdata
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_SYNCVIDEOPORTDATA extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_local">DD_DIRECTDRAW_LOCAL</a> structure that is relevant to the current Microsoft DirectDraw process only.
     * @type {Pointer<Ptr>}
     */
    lpDD {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_videoport_local">DD_VIDEOPORT_LOCAL</a> structure that describes the hardware video port with which to sync.
     * @type {Pointer<DD_VIDEOPORT_LOCAL>}
     */
    lpVideoPort {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Contains the byte offset from the top left corner of the surface to the top left corner of where the VPE object writes its data. This value is only used by the video miniport driver. This member must contain data that is filled in by the driver.
     * @type {Integer}
     */
    dwOriginOffset {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Contains the height in pixels of the VPE object data. By default, this is twice the field height when interleaved, but the driver can change this if it needs to. This value is used only by the video miniport driver. This member can be modified by the driver, but does not need to be.
     * @type {Integer}
     */
    dwHeight {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Contains the number of lines in the <a href="https://docs.microsoft.com/windows-hardware/drivers/">VBI</a> region. This value is used only by the video miniport driver. This member can be modified by the driver, but does not need to be.
     * @type {Integer}
     */
    dwVBIHeight {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Is reserved for use by the display driver.
     * @type {Integer}
     */
    dwDriverReserved1 {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Reserved for use by the display driver.
     * @type {Integer}
     */
    dwDriverReserved2 {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Reserved for use by the display driver.
     * @type {Integer}
     */
    dwDriverReserved3 {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_kernelcb_syncvideoport">DdSyncVideoPortData</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     * @type {Integer}
     */
    ddRVal {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }
}
