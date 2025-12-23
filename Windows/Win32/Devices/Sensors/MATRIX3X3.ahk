#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\VEC3D.ahk

/**
 * @namespace Windows.Win32.Devices.Sensors
 * @version v4.0.30319
 */
class MATRIX3X3 extends Win32Struct
{
    static sizeof => 36

    static packingSize => 4

    /**
     * @type {Float}
     */
    A11 {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * @type {Float}
     */
    A12 {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * @type {Float}
     */
    A13 {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * @type {Float}
     */
    A21 {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }

    /**
     * @type {Float}
     */
    A22 {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * @type {Float}
     */
    A23 {
        get => NumGet(this, 20, "float")
        set => NumPut("float", value, this, 20)
    }

    /**
     * @type {Float}
     */
    A31 {
        get => NumGet(this, 24, "float")
        set => NumPut("float", value, this, 24)
    }

    /**
     * @type {Float}
     */
    A32 {
        get => NumGet(this, 28, "float")
        set => NumPut("float", value, this, 28)
    }

    /**
     * @type {Float}
     */
    A33 {
        get => NumGet(this, 32, "float")
        set => NumPut("float", value, this, 32)
    }

    /**
     * @type {VEC3D}
     */
    V1{
        get {
            if(!this.HasProp("__V1"))
                this.__V1 := VEC3D(0, this)
            return this.__V1
        }
    }

    /**
     * @type {VEC3D}
     */
    V2{
        get {
            if(!this.HasProp("__V2"))
                this.__V2 := VEC3D(12, this)
            return this.__V2
        }
    }

    /**
     * @type {VEC3D}
     */
    V3{
        get {
            if(!this.HasProp("__V3"))
                this.__V3 := VEC3D(24, this)
            return this.__V3
        }
    }

    /**
     * @type {Array<Single>}
     */
    M{
        get {
            if(!this.HasProp("__MProxyArray"))
                this.__MProxyArray := Win32FixedArray(this.ptr + 0, 9, Primitive, "float")
            return this.__MProxyArray
        }
    }
}
