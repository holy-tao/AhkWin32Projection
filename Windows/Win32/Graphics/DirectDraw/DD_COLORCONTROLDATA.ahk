#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DD_COLORCONTROLDATA structure contains the color control information for the specified overlay.
 * @see https://docs.microsoft.com/windows/win32/api//ddrawint/ns-ddrawint-dd_colorcontroldata
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_COLORCONTROLDATA extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_global">DD_DIRECTDRAW_GLOBAL</a> structure that describes the driver's device.
     * @type {Pointer<DD_DIRECTDRAW_GLOBAL>}
     */
    lpDD {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Points to the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_surface_local">DD_SURFACE_LOCAL</a> structure representing the overlay surface.
     * @type {Pointer<DD_SURFACE_LOCAL>}
     */
    lpDDSurface {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Points to a <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff549237(v=vs.85)">DDCOLORCONTROL</a> structure. See the <b>dwFlags</b> member to determine how to use this member.
     * @type {Pointer<DDCOLORCONTROL>}
     */
    lpColorData {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * 
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_colorcb_colorcontrol">DdControlColor</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     * @type {HRESULT}
     */
    ddRVal {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * Used by the Microsoft DirectDraw API and should not be filled in by the driver.
     * @type {Pointer<Void>}
     */
    ColorControl {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
