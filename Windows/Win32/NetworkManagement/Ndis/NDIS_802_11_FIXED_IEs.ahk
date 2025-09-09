#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_802_11_FIXED_IEs extends Win32Struct
{
    static sizeof => 12

    static packingSize => 2

    /**
     * @type {Array<Byte>}
     */
    Timestamp{
        get {
            if(!this.HasProp("__TimestampProxyArray"))
                this.__TimestampProxyArray := Win32FixedArray(this.ptr + 0, 8, Primitive, "char")
            return this.__TimestampProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    BeaconInterval {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Capabilities {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }
}
