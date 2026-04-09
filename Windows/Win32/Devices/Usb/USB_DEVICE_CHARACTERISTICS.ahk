#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 */
class USB_DEVICE_CHARACTERISTICS extends Win32Struct {
    static sizeof => 24

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved {
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 4, 2, Primitive, "uint")
            return this.__ReservedProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    UsbDeviceCharacteristicsFlags {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    MaximumSendPathDelayInMilliSeconds {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    MaximumCompletionPathDelayInMilliSeconds {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
