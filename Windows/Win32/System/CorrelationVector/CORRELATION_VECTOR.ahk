#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.CorrelationVector
 * @version v4.0.30319
 */
class CORRELATION_VECTOR extends Win32Struct
{
    static sizeof => 130

    static packingSize => 1

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Array<SByte>}
     */
    Vector{
        get {
            if(!this.HasProp("__VectorProxyArray"))
                this.__VectorProxyArray := Win32FixedArray(this.ptr + 1, 129, Primitive, "char")
            return this.__VectorProxyArray
        }
    }
}
