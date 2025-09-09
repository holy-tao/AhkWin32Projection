#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class WST_BUFFER_LINE extends Win32Struct
{
    static sizeof => 43

    static packingSize => 1

    /**
     * @type {Integer}
     */
    Confidence {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    Bytes{
        get {
            if(!this.HasProp("__BytesProxyArray"))
                this.__BytesProxyArray := Win32FixedArray(this.ptr + 1, 42, Primitive, "char")
            return this.__BytesProxyArray
        }
    }
}
