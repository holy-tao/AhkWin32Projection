#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DDRAWI_DDRAWSURFACE_INT.ahk
#Include .\DBLNODE.ahk
#Include .\DDRAWI_DDRAWSURFACE_LCL.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
class DBLNODE extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Pointer<DBLNODE>}
     */
    next {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<DBLNODE>}
     */
    prev {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<DDRAWI_DDRAWSURFACE_LCL>}
     */
    object {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<DDRAWI_DDRAWSURFACE_INT>}
     */
    object_int {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
