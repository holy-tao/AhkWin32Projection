#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class WHEA_ARM_PROCESSOR_ERROR_CONTEXT_INFORMATION_HEADER extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    RegisterContextType {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    RegisterArraySize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<Byte>}
     */
    RegisterArray{
        get {
            if(!this.HasProp("__RegisterArrayProxyArray"))
                this.__RegisterArrayProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__RegisterArrayProxyArray
        }
    }
}
