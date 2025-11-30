#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_802_11_SSID extends Win32Struct
{
    static sizeof => 36

    static packingSize => 4

    /**
     * @type {Integer}
     */
    SsidLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    Ssid{
        get {
            if(!this.HasProp("__SsidProxyArray"))
                this.__SsidProxyArray := Win32FixedArray(this.ptr + 4, 32, Primitive, "char")
            return this.__SsidProxyArray
        }
    }
}
