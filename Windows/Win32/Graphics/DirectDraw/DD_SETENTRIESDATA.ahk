#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DD_SETENTRIESDATA structure contains information necessary to set palette entries.
 * @see https://docs.microsoft.com/windows/win32/api//ddrawint/ns-ddrawint-dd_setentriesdata
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_SETENTRIESDATA extends Win32Struct
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
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_palette_global">DD_PALETTE_GLOBAL</a> structure that represents the DirectDrawPalette object.
     * @type {Pointer<DD_PALETTE_GLOBAL>}
     */
    lpDDPalette {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Specifies a zero-based index into the color table of the first entry to be modified.
     * @type {Integer}
     */
    dwBase {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Specifies the number of palette entries that the driver should update.
     * @type {Integer}
     */
    dwNumEntries {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Points to a PALETTEENTRY structure that specifies the color table. See the latest Microsoft DirectX SDK documentation for more information about PALETTEENTRY.
     * @type {Pointer<PALETTEENTRY>}
     */
    lpEntries {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_palcb_setentries">DdSetEntries</a> callback. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     * @type {HRESULT}
     */
    ddRVal {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * Used by the Microsoft DirectDraw API and should not be filled in by the driver.
     * @type {Pointer<Void>}
     */
    SetEntries {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
