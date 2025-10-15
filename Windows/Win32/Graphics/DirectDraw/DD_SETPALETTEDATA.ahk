#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * The DD_SETPALETTEDATA structure contains information necessary to set a palette for a specific surface.
 * @see https://docs.microsoft.com/windows/win32/api//ddrawint/ns-ddrawint-dd_setpalettedata
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_SETPALETTEDATA extends Win32Struct
{
    static sizeof => 48

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
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_surface_local">DD_SURFACE_LOCAL</a> structure that represents the DirectDrawSurface object.
     * @type {Pointer<DD_SURFACE_LOCAL>}
     */
    lpDDSurface {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_palette_global">DD_PALETTE_GLOBAL</a> structure that specifies the palette to set to the surface.
     * @type {Pointer<DD_PALETTE_GLOBAL>}
     */
    lpDDPalette {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_setpalette">DdSetPalette</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     * @type {HRESULT}
     */
    ddRVal {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Used by the Microsoft DirectDraw API and should not be filled in by the driver.
     * @type {Pointer<Void>}
     */
    SetPalette {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Indicates whether to attach this palette to the surface.
     * @type {BOOL}
     */
    Attach{
        get {
            if(!this.HasProp("__Attach"))
                this.__Attach := BOOL(this.ptr + 40)
            return this.__Attach
        }
    }
}
