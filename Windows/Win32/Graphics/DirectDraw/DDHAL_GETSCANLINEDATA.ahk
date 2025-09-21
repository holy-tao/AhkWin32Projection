#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDHAL_GETSCANLINEDATA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Pointer<DDRAWI_DIRECTDRAW_GBL>}
     */
    lpDD {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwScanLine {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {HRESULT}
     */
    ddRVal {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {Pointer<LPDDHAL_GETSCANLINE>}
     */
    GetScanLine {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
