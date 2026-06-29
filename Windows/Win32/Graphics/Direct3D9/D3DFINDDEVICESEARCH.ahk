#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include .\D3DPRIMCAPS.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
class D3DFINDDEVICESEARCH extends Win32Struct {
    static sizeof => 92

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
     * @type {BOOL}
     */
    bHardware {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dcmColorModel {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Guid}
     */
    guid {
        get {
            if(!this.HasProp("__guid"))
                this.__guid := Guid(16, this)
            return this.__guid
        }
    }

    /**
     * @type {Integer}
     */
    dwCaps {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {D3DPRIMCAPS}
     */
    dpcPrimCaps {
        get {
            if(!this.HasProp("__dpcPrimCaps"))
                this.__dpcPrimCaps := D3DPRIMCAPS(36, this)
            return this.__dpcPrimCaps
        }
    }
}
