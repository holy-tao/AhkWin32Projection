#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DDRAWI_DDRAWSURFACE_INT.ahk
#Include .\DDRAWI_DDRAWSURFACE_LCL.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
class DDRAWI_DDRAWSURFACE_INT extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Pointer<Void>}
     */
    lpVtbl {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<DDRAWI_DDRAWSURFACE_LCL>}
     */
    lpLcl {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<DDRAWI_DDRAWSURFACE_INT>}
     */
    lpLink {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwIntRefCnt {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
