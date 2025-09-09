#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * A union of scalar types.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_scalar_union
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_SCALAR_UNION extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * An 8-byte array.
     * @type {Array<Byte>}
     */
    Bytes{
        get {
            if(!this.HasProp("__BytesProxyArray"))
                this.__BytesProxyArray := Win32FixedArray(this.ptr + 0, 8, Primitive, "char")
            return this.__BytesProxyArray
        }
    }

    /**
     * An 8-bit signed integer.
     * @type {Integer}
     */
    Int8 {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * An 8-bit unsigned integer.
     * @type {Integer}
     */
    UInt8 {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * A 16-bit signed integer.
     * @type {Integer}
     */
    Int16 {
        get => NumGet(this, 0, "short")
        set => NumPut("short", value, this, 0)
    }

    /**
     * A 16-bit unsigned integer.
     * @type {Integer}
     */
    UInt16 {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * A 32-bit signed integer.
     * @type {Integer}
     */
    Int32 {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A 32-bit unsigned integer.
     * @type {Integer}
     */
    UInt32 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A 64-bit signed integer.
     * @type {Integer}
     */
    Int64 {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * A 64-bit unsigned integer.
     * @type {Integer}
     */
    UInt64 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A single precision floating-point number.
     * @type {Float}
     */
    Float32 {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * A double precision floating-point number.
     * @type {Float}
     */
    Float64 {
        get => NumGet(this, 0, "double")
        set => NumPut("double", value, this, 0)
    }
}
