#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_WPS_DEVICE_NAME extends Win32Struct
{
    static sizeof => 36

    static packingSize => 4

    /**
     * @type {Integer}
     */
    uDeviceNameLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    ucDeviceName{
        get {
            if(!this.HasProp("__ucDeviceNameProxyArray"))
                this.__ucDeviceNameProxyArray := Win32FixedArray(this.ptr + 4, 32, Primitive, "char")
            return this.__ucDeviceNameProxyArray
        }
    }
}
