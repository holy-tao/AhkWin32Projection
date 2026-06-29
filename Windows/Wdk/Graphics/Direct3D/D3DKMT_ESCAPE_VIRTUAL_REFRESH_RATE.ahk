#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\BOOLEAN.ahk
#Include .\D3DKMT_ESCAPE_VIRTUAL_REFRESH_RATE_TYPE.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_ESCAPE_VIRTUAL_REFRESH_RATE extends Win32Struct {
    static sizeof => 36

    static packingSize => 4

    /**
     * @type {D3DKMT_ESCAPE_VIRTUAL_REFRESH_RATE_TYPE}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    VidPnSourceId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {BOOLEAN}
     */
    ProcessBoostEligible {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    VSyncMultiplier {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    BaseDesktopDuration {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved {
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 20, 16, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }
}
