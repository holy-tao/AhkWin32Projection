#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_802_11_AI_REQFI extends Win32Struct
{
    static sizeof => 10

    static packingSize => 2

    /**
     * @type {Integer}
     */
    Capabilities {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ListenInterval {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Array<Byte>}
     */
    CurrentAPAddress{
        get {
            if(!this.HasProp("__CurrentAPAddressProxyArray"))
                this.__CurrentAPAddressProxyArray := Win32FixedArray(this.ptr + 4, 6, Primitive, "char")
            return this.__CurrentAPAddressProxyArray
        }
    }
}
