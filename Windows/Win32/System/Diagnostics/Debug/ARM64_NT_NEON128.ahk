#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class ARM64_NT_NEON128 extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Low {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    High {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * @type {Array<Double>}
     */
    D{
        get {
            if(!this.HasProp("__DProxyArray"))
                this.__DProxyArray := Win32FixedArray(this.ptr + 0, 8, Primitive, "double")
            return this.__DProxyArray
        }
    }

    /**
     * @type {Array<Single>}
     */
    S{
        get {
            if(!this.HasProp("__SProxyArray"))
                this.__SProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "float")
            return this.__SProxyArray
        }
    }

    /**
     * @type {Array<UInt16>}
     */
    H{
        get {
            if(!this.HasProp("__HProxyArray"))
                this.__HProxyArray := Win32FixedArray(this.ptr + 0, 2, Primitive, "ushort")
            return this.__HProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    B{
        get {
            if(!this.HasProp("__BProxyArray"))
                this.__BProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__BProxyArray
        }
    }
}
