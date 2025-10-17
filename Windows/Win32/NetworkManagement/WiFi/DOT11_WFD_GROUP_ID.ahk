#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOT11_SSID.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_WFD_GROUP_ID extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Array<Byte>}
     */
    DeviceAddress{
        get {
            if(!this.HasProp("__DeviceAddressProxyArray"))
                this.__DeviceAddressProxyArray := Win32FixedArray(this.ptr + 0, 6, Primitive, "char")
            return this.__DeviceAddressProxyArray
        }
    }

    /**
     * @type {DOT11_SSID}
     */
    SSID{
        get {
            if(!this.HasProp("__SSID"))
                this.__SSID := DOT11_SSID(8, this)
            return this.__SSID
        }
    }
}
