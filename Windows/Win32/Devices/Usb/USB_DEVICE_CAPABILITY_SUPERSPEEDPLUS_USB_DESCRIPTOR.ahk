#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USB_DEVICE_CAPABILITY_SUPERSPEEDPLUS_SPEED.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_DEVICE_CAPABILITY_SUPERSPEEDPLUS_USB_DESCRIPTOR extends Win32Struct
{
    static sizeof => 20

    static packingSize => 1

    /**
     * @type {Integer}
     */
    bLength {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    bDescriptorType {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    bDevCapabilityType {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    bReserved {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {Integer}
     */
    AsUlong {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Anonymous {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    AsUshort {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    wReserved {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * @type {Array<USB_DEVICE_CAPABILITY_SUPERSPEEDPLUS_SPEED>}
     */
    bmSublinkSpeedAttr{
        get {
            if(!this.HasProp("__bmSublinkSpeedAttrProxyArray"))
                this.__bmSublinkSpeedAttrProxyArray := Win32FixedArray(this.ptr + 12, 8, USB_DEVICE_CAPABILITY_SUPERSPEEDPLUS_SPEED, "")
            return this.__bmSublinkSpeedAttrProxyArray
        }
    }
}
