#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DDSCAPS.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class VIDMEM extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    fpStart {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer}
     */
    fpEnd {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwWidth {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {DDSCAPS}
     */
    ddsCaps{
        get {
            if(!this.HasProp("__ddsCaps"))
                this.__ddsCaps := DDSCAPS(this.ptr + 28)
            return this.__ddsCaps
        }
    }

    /**
     * @type {DDSCAPS}
     */
    ddsCapsAlt{
        get {
            if(!this.HasProp("__ddsCapsAlt"))
                this.__ddsCapsAlt := DDSCAPS(this.ptr + 32)
            return this.__ddsCapsAlt
        }
    }

    /**
     * @type {Pointer<VMEMHEAP>}
     */
    lpHeap {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    dwHeight {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
