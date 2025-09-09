#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class CC_BYTE_PAIR extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * @type {Array<Byte>}
     */
    Decoded{
        get {
            if(!this.HasProp("__DecodedProxyArray"))
                this.__DecodedProxyArray := Win32FixedArray(this.ptr + 0, 2, Primitive, "char")
            return this.__DecodedProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }
}
