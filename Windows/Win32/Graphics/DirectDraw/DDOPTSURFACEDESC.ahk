#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DDSCAPS2.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDOPTSURFACEDESC extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {DDSCAPS2}
     */
    ddSCaps{
        get {
            if(!this.HasProp("__ddSCaps"))
                this.__ddSCaps := DDSCAPS2(this.ptr + 8)
            return this.__ddSCaps
        }
    }

    /**
     * @type {Integer}
     */
    ddOSCaps {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Pointer<Guid>}
     */
    guid {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    dwCompressionRatio {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
