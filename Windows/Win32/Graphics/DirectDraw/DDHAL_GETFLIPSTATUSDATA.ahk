#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDHAL_GETFLIPSTATUSDATA extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Pointer<DDRAWI_DIRECTDRAW_GBL>}
     */
    lpDD {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<DDRAWI_DDRAWSURFACE_LCL>}
     */
    lpDDSurface {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {HRESULT}
     */
    ddRVal {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * @type {Pointer<LPDDHALSURFCB_GETFLIPSTATUS>}
     */
    GetFlipStatus {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
