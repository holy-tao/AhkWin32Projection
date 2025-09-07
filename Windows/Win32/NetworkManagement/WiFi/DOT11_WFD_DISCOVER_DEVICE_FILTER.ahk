#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOT11_SSID.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_WFD_DISCOVER_DEVICE_FILTER extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Array<Byte>}
     */
    DeviceID{
        get {
            if(!this.HasProp("__DeviceIDProxyArray"))
                this.__DeviceIDProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__DeviceIDProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    ucBitmask {
        get => NumGet(this, 6, "char")
        set => NumPut("char", value, this, 6)
    }

    /**
     * @type {DOT11_SSID}
     */
    GroupSSID{
        get {
            if(!this.HasProp("__GroupSSID"))
                this.__GroupSSID := DOT11_SSID(this.ptr + 8)
            return this.__GroupSSID
        }
    }
}
