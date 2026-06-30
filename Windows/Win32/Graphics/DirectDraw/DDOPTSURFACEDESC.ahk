#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DDOSCAPS.ahk
#Include .\DDSCAPS2.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
class DDOPTSURFACEDESC extends Win32Struct {
    static sizeof => 48

    static packingSize => 4

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
    ddSCaps {
        get {
            if(!this.HasProp("__ddSCaps"))
                this.__ddSCaps := DDSCAPS2(8, this)
            return this.__ddSCaps
        }
    }

    /**
     * @type {DDOSCAPS}
     */
    ddOSCaps {
        get {
            if(!this.HasProp("__ddOSCaps"))
                this.__ddOSCaps := DDOSCAPS(24, this)
            return this.__ddOSCaps
        }
    }

    /**
     * @type {Guid}
     */
    guid {
        get {
            if(!this.HasProp("__guid"))
                this.__guid := Guid(28, this)
            return this.__guid
        }
    }

    /**
     * @type {Integer}
     */
    dwCompressionRatio {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }
}
