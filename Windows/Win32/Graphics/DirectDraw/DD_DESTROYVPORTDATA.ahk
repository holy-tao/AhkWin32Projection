#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DD_DESTROYVPORTDATA structure contains the information necessary for the driver to clean up.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_destroyvportdata
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_DESTROYVPORTDATA extends Win32Struct
{
    static sizeof => 32

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
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_destroyvport">DdVideoPortDestroy</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     * @type {Integer}
     */
    ddRVal {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Used by the DirectDraw API and should not be filled in by the driver.
     * @type {Pointer<Void>}
     */
    DestroyVideoPort {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
