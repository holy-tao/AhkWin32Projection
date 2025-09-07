#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_WFD_ADVERTISEMENT_ID extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    AdvertisementID {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    ServiceAddress{
        get {
            if(!this.HasProp("__ServiceAddressProxyArray"))
                this.__ServiceAddressProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__ServiceAddressProxyArray
        }
    }
}
