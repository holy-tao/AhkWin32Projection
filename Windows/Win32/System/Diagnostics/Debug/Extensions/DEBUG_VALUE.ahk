#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class DEBUG_VALUE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    class _I64Parts32 extends Win32Struct {
        static sizeof => 8
        static packingSize => 4

        /**
         * @type {Integer}
         */
        LowPart {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        HighPart {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
    }

    class _F128Parts64 extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Integer}
         */
        LowPart {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        HighPart {
            get => NumGet(this, 8, "int64")
            set => NumPut("int64", value, this, 8)
        }
    
    }

    /**
     * @type {Integer}
     */
    I8 {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    I16 {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    I32 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    I64 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {BOOL}
     */
    Nat {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Float}
     */
    F32 {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * @type {Float}
     */
    F64 {
        get => NumGet(this, 0, "double")
        set => NumPut("double", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    F80Bytes{
        get {
            if(!this.HasProp("__F80BytesProxyArray"))
                this.__F80BytesProxyArray := Win32FixedArray(this.ptr + 0, 10, Primitive, "char")
            return this.__F80BytesProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    F82Bytes{
        get {
            if(!this.HasProp("__F82BytesProxyArray"))
                this.__F82BytesProxyArray := Win32FixedArray(this.ptr + 0, 11, Primitive, "char")
            return this.__F82BytesProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    F128Bytes{
        get {
            if(!this.HasProp("__F128BytesProxyArray"))
                this.__F128BytesProxyArray := Win32FixedArray(this.ptr + 0, 16, Primitive, "char")
            return this.__F128BytesProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    VI8{
        get {
            if(!this.HasProp("__VI8ProxyArray"))
                this.__VI8ProxyArray := Win32FixedArray(this.ptr + 0, 16, Primitive, "char")
            return this.__VI8ProxyArray
        }
    }

    /**
     * @type {Array<UInt16>}
     */
    VI16{
        get {
            if(!this.HasProp("__VI16ProxyArray"))
                this.__VI16ProxyArray := Win32FixedArray(this.ptr + 0, 8, Primitive, "ushort")
            return this.__VI16ProxyArray
        }
    }

    /**
     * @type {Array<UInt32>}
     */
    VI32{
        get {
            if(!this.HasProp("__VI32ProxyArray"))
                this.__VI32ProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "uint")
            return this.__VI32ProxyArray
        }
    }

    /**
     * @type {Array<UInt64>}
     */
    VI64{
        get {
            if(!this.HasProp("__VI64ProxyArray"))
                this.__VI64ProxyArray := Win32FixedArray(this.ptr + 0, 2, Primitive, "uint")
            return this.__VI64ProxyArray
        }
    }

    /**
     * @type {Array<Single>}
     */
    VF32{
        get {
            if(!this.HasProp("__VF32ProxyArray"))
                this.__VF32ProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "float")
            return this.__VF32ProxyArray
        }
    }

    /**
     * @type {Array<Double>}
     */
    VF64{
        get {
            if(!this.HasProp("__VF64ProxyArray"))
                this.__VF64ProxyArray := Win32FixedArray(this.ptr + 0, 2, Primitive, "double")
            return this.__VF64ProxyArray
        }
    }

    /**
     * @type {_I64Parts32}
     */
    I64Parts32{
        get {
            if(!this.HasProp("__I64Parts32"))
                this.__I64Parts32 := %this.__Class%._I64Parts32(0, this)
            return this.__I64Parts32
        }
    }

    /**
     * @type {_F128Parts64}
     */
    F128Parts64{
        get {
            if(!this.HasProp("__F128Parts64"))
                this.__F128Parts64 := %this.__Class%._F128Parts64(0, this)
            return this.__F128Parts64
        }
    }

    /**
     * @type {Array<Byte>}
     */
    RawBytes{
        get {
            if(!this.HasProp("__RawBytesProxyArray"))
                this.__RawBytesProxyArray := Win32FixedArray(this.ptr + 0, 24, Primitive, "char")
            return this.__RawBytesProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    TailOfRawBytes {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
