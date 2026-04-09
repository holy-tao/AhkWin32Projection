#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WINDOWS_IRDA_DEVICE_INFO.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
class WINDOWS_DEVICELIST extends Win32Struct {
    static sizeof => 36

    static packingSize => 4

    /**
     * @type {Integer}
     */
    numDevice {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {WINDOWS_IRDA_DEVICE_INFO}
     */
    Device {
        get {
            if(!this.HasProp("__DeviceProxyArray"))
                this.__DeviceProxyArray := Win32FixedArray(this.ptr + 4, 1, WINDOWS_IRDA_DEVICE_INFO, "")
            return this.__DeviceProxyArray
        }
    }
}
