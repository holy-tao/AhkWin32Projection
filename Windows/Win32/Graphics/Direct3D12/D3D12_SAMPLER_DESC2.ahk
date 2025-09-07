#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_SAMPLER_DESC2 extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Filter {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    AddressU {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    AddressV {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    AddressW {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {Float}
     */
    MipLODBias {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    MaxAnisotropy {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    ComparisonFunc {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {Array<Single>}
     */
    FloatBorderColor{
        get {
            if(!this.HasProp("__FloatBorderColorProxyArray"))
                this.__FloatBorderColorProxyArray := Win32FixedArray(this.ptr + 32, 4, Primitive, "float")
            return this.__FloatBorderColorProxyArray
        }
    }

    /**
     * @type {Array<UInt32>}
     */
    UintBorderColor{
        get {
            if(!this.HasProp("__UintBorderColorProxyArray"))
                this.__UintBorderColorProxyArray := Win32FixedArray(this.ptr + 32, 4, Primitive, "uint")
            return this.__UintBorderColorProxyArray
        }
    }

    /**
     * @type {Float}
     */
    MinLOD {
        get => NumGet(this, 48, "float")
        set => NumPut("float", value, this, 48)
    }

    /**
     * @type {Float}
     */
    MaxLOD {
        get => NumGet(this, 52, "float")
        set => NumPut("float", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }
}
