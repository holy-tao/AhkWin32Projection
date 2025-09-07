#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_STATIC_SAMPLER_DESC1 extends Win32Struct
{
    static sizeof => 56

    static packingSize => 4

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
     * @type {Integer}
     */
    BorderColor {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * @type {Float}
     */
    MinLOD {
        get => NumGet(this, 32, "float")
        set => NumPut("float", value, this, 32)
    }

    /**
     * @type {Float}
     */
    MaxLOD {
        get => NumGet(this, 36, "float")
        set => NumPut("float", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    ShaderRegister {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    RegisterSpace {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    ShaderVisibility {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }
}
