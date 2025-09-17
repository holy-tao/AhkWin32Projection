#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DD_WAITFORVPORTSYNCDATA structure contains the information required for the driver to synchronize the video port extensions (VPE) object.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_waitforvportsyncdata
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_WAITFORVPORTSYNCDATA extends Win32Struct
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
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_videoport_local">DD_VIDEOPORT_LOCAL</a> structure that represents this VPE object.
     * @type {Pointer<DD_VIDEOPORT_LOCAL>}
     */
    lpVideoPort {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * 
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Specifies the line number on which the driver should synchronize when <b>dwFlags</b> is DDVPWAIT_LINE. The driver should ignore this member when <b>dwFlags</b> is set to DDVPWAIT_BEGIN or DDVPWAIT_END.
     * @type {Integer}
     */
    dwLine {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Specifies the maximum amount of time the driver should wait, in milliseconds, before timing out.
     * @type {Integer}
     */
    dwTimeOut {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_waitforsync">DdVideoPortWaitForSync</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     * @type {Integer}
     */
    ddRVal {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * Used by the DirectDraw API and should not be filled in by the driver.
     * @type {Pointer<Void>}
     */
    UpdateVideoPort {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
