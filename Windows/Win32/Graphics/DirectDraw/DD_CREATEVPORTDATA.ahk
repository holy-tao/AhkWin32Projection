#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DD_CREATEVPORTDATA structure contains the information necessary to describe the video port extensions (VPE) object being created.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_createvportdata
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_CREATEVPORTDATA extends Win32Struct
{
    static sizeof => 40

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
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/dvp/ns-dvp-ddvideoportdesc">DDVIDEOPORTDESC</a> structure that describes the created VPE object.
     * @type {Pointer<DDVIDEOPORTDESC>}
     */
    lpDDVideoPortDesc {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_videoport_local">DD_VIDEOPORT_LOCAL</a> structure that represents the created VPE object.
     * @type {Pointer<DD_VIDEOPORT_LOCAL>}
     */
    lpVideoPort {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_createvideoport">DdVideoPortCreate</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     * @type {HRESULT}
     */
    ddRVal {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Used by the DirectDraw API and should not be filled in by the driver.
     * @type {Pointer<Void>}
     */
    CreateVideoPort {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
