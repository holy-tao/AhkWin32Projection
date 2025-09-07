#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class SpanningEventDescriptor extends Win32Struct
{
    static sizeof => 8

    static packingSize => 2

    /**
     * @type {Integer}
     */
    wDataLen {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    wProgNumber {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    wSID {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Array<Byte>}
     */
    bDescriptor{
        get {
            if(!this.HasProp("__bDescriptorProxyArray"))
                this.__bDescriptorProxyArray := Win32FixedArray(this.ptr + 6, 1, Primitive, "char")
            return this.__bDescriptorProxyArray
        }
    }
}
