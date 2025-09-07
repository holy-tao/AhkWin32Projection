#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DD_PALETTECALLBACKS structure contains entry pointers to the DirectDraw palette callback functions that a device driver supports.
 * @remarks
 * Entries that the display driver does not use should be set to <b>NULL</b>. The driver initializes this structure in <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvenabledirectdraw">DrvEnableDirectDraw</a>.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_palettecallbacks
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_PALETTECALLBACKS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Specifies the size in bytes of this DD_PALETTECALLBACKS structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Indicates what DirectDrawPalette callback functions the driver has implemented. For every bit set in <b>dwFlags</b>, the driver must initialize the corresponding function pointer member of this structure. This member can be one or more of the following flags:
     * 
     * 
     * <dl>
     * <dt>DDHAL_PALCB32_DESTROYPALETTE</dt>
     * <dt>DDHAL_PALCB32_SETENTRIES</dt>
     * </dl>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_palcb_destroypalette">DdDestroyPalette</a> palette callback.
     * @type {Pointer<Ptr>}
     */
    DestroyPalette {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_palcb_setentries">DdSetEntries</a> palette callback.
     * @type {Pointer<Ptr>}
     */
    SetEntries {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
