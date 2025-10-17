#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USB_HUB_DESCRIPTOR.ahk
#Include .\USB_30_HUB_DESCRIPTOR.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_HUB_INFORMATION_EX extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * @type {Integer}
     */
    HubType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    HighestPortNumber {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {USB_HUB_DESCRIPTOR}
     */
    UsbHubDescriptor{
        get {
            if(!this.HasProp("__UsbHubDescriptor"))
                this.__UsbHubDescriptor := USB_HUB_DESCRIPTOR(8, this)
            return this.__UsbHubDescriptor
        }
    }

    /**
     * @type {USB_30_HUB_DESCRIPTOR}
     */
    Usb30HubDescriptor{
        get {
            if(!this.HasProp("__Usb30HubDescriptor"))
                this.__Usb30HubDescriptor := USB_30_HUB_DESCRIPTOR(8, this)
            return this.__Usb30HubDescriptor
        }
    }
}
