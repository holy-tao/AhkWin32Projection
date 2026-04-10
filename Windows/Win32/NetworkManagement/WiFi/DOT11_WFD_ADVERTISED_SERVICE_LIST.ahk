#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOT11_WFD_ADVERTISED_SERVICE_DESCRIPTOR.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class DOT11_WFD_ADVERTISED_SERVICE_LIST extends Win32Struct {
    static sizeof => 268

    static packingSize => 4

    /**
     * @type {Integer}
     */
    ServiceCount {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {DOT11_WFD_ADVERTISED_SERVICE_DESCRIPTOR}
     */
    AdvertisedService {
        get {
            if(!this.HasProp("__AdvertisedServiceProxyArray"))
                this.__AdvertisedServiceProxyArray := Win32FixedArray(this.ptr + 4, 1, DOT11_WFD_ADVERTISED_SERVICE_DESCRIPTOR, "")
            return this.__AdvertisedServiceProxyArray
        }
    }
}
