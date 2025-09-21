#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDHAL_SETENTRIESDATA extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Pointer<DDRAWI_DIRECTDRAW_GBL>}
     */
    lpDD {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<DDRAWI_DDRAWPALETTE_GBL>}
     */
    lpDDPalette {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwBase {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwNumEntries {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Pointer<PALETTEENTRY>}
     */
    lpEntries {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {HRESULT}
     */
    ddRVal {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * @type {Pointer<LPDDHALPALCB_SETENTRIES>}
     */
    SetEntries {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
