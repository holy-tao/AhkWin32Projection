#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class DEBUG_DECODE_ERROR extends Win32Struct
{
    static sizeof => 336

    static packingSize => 4

    /**
     * @type {Integer}
     */
    SizeOfStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Code {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    TreatAsStatus {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Array<SByte>}
     */
    Source{
        get {
            if(!this.HasProp("__SourceProxyArray"))
                this.__SourceProxyArray := Win32FixedArray(this.ptr + 12, 64, Primitive, "char")
            return this.__SourceProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    Message{
        get {
            if(!this.HasProp("__MessageProxyArray"))
                this.__MessageProxyArray := Win32FixedArray(this.ptr + 76, 260, Primitive, "char")
            return this.__MessageProxyArray
        }
    }
}
