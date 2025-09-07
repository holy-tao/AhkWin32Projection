#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Nfc
 * @version v4.0.30319
 */
class SECURE_ELEMENT_HCE_DATA_PACKET extends Win32Struct
{
    static sizeof => 6

    static packingSize => 2

    /**
     * @type {Integer}
     */
    bConnectionId {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    cbPayload {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Array<Byte>}
     */
    pbPayload{
        get {
            if(!this.HasProp("__pbPayloadProxyArray"))
                this.__pbPayloadProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__pbPayloadProxyArray
        }
    }
}
