#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DD_UPDATEVPORTDATA structure contains the information required to start, stop, and change the video port extensions (VPE) object.
 * @see https://docs.microsoft.com/windows/win32/api//ddrawint/ns-ddrawint-dd_updatevportdata
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_UPDATEVPORTDATA extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_local">DD_DIRECTDRAW_LOCAL</a> structure that is relevant to the current Microsoft DirectDraw process only.
     * @type {Pointer<DD_DIRECTDRAW_LOCAL>}
     */
    lpDD {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_videoport_local">DD_VIDEOPORT_LOCAL</a> structure that represents this VPE object.
     * @type {Pointer<DD_VIDEOPORT_LOCAL>}
     */
    lpVideoPort {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Points to an array of <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_surface_int">DD_SURFACE_INT</a> structures that represent regular video surfaces. This member can be <b>NULL</b>.
     * @type {Pointer<DD_SURFACE_INT>}
     */
    lplpDDSurface {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Points to an array of DD_SURFACE_INT structures that represent <a href="https://docs.microsoft.com/windows-hardware/drivers/">VBI</a> surfaces. This member can be <b>NULL</b>.
     * @type {Pointer<DD_SURFACE_INT>}
     */
    lplpDDVBISurface {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/dvp/ns-dvp-ddvideoportinfo">DDVIDEOPORTINFO</a> structure that describes how the VPE object should transfer video data to a surface. This member can be <b>NULL</b> when <b>dwFlags</b> is DDRAWI_VPORTSTOP.
     * @type {Pointer<DDVIDEOPORTINFO>}
     */
    lpVideoInfo {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * 
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Specifies the number of surfaces in the list to which <b>lplpDDSurface</b> points. If this member is greater than 1, <b>lplpDDSurface</b> is an array of surface structures to accommodate autoflipping.
     * @type {Integer}
     */
    dwNumAutoflip {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Specifies the number of surfaces in the list to which <b>lplpDDVBISurface</b> points. If this member is greater than 1, <b>lplpDDVBISurface</b> is an array of surface structures to accommodate autoflipping of <a href="https://docs.microsoft.com/windows-hardware/drivers/">VBI</a> data.
     * @type {Integer}
     */
    dwNumVBIAutoflip {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_update">DdVideoPortUpdate</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     * @type {HRESULT}
     */
    ddRVal {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }

    /**
     * Used by the DirectDraw API and should not be filled in by the driver.
     * @type {Pointer<Void>}
     */
    UpdateVideoPort {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
