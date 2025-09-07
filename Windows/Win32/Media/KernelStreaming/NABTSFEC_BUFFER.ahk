#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class NABTSFEC_BUFFER extends Win32Struct
{
    static sizeof => 456

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dataSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    groupID {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * @type {Array<Byte>}
     */
    data{
        get {
            if(!this.HasProp("__dataProxyArray"))
                this.__dataProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__dataProxyArray
        }
    }
}
