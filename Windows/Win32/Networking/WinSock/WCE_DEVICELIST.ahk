#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WCE_IRDA_DEVICE_INFO.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class WCE_DEVICELIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    numDevice {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<WCE_IRDA_DEVICE_INFO>}
     */
    Device{
        get {
            if(!this.HasProp("__DeviceProxyArray"))
                this.__DeviceProxyArray := Win32FixedArray(this.ptr + 8, 8, WCE_IRDA_DEVICE_INFO, "")
            return this.__DeviceProxyArray
        }
    }
}
