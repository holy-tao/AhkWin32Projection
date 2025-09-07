#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Nfc
 * @version v4.0.30319
 */
class NFC_DATA_BUFFER extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * @type {Integer}
     */
    cbBuffer {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    pbBuffer{
        get {
            if(!this.HasProp("__pbBufferProxyArray"))
                this.__pbBufferProxyArray := Win32FixedArray(this.ptr + 2, 1, Primitive, "char")
            return this.__pbBufferProxyArray
        }
    }
}
