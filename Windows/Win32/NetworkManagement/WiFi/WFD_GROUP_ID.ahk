#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOT11_SSID.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class WFD_GROUP_ID extends Win32Struct {
    static sizeof => 44

    static packingSize => 4

    /**
     * @type {Array<Integer>}
     */
    DeviceAddress {
        get {
            if(!this.HasProp("__DeviceAddressProxyArray"))
                this.__DeviceAddressProxyArray := Win32FixedArray(this.ptr + 0, 6, Primitive, "char")
            return this.__DeviceAddressProxyArray
        }
    }

    /**
     * @type {DOT11_SSID}
     */
    GroupSSID {
        get {
            if(!this.HasProp("__GroupSSID"))
                this.__GroupSSID := DOT11_SSID(8, this)
            return this.__GroupSSID
        }
    }
}
