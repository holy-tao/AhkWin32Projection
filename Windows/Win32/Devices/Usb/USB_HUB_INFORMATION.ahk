#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USB_HUB_DESCRIPTOR.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_HUB_INFORMATION extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {USB_HUB_DESCRIPTOR}
     */
    HubDescriptor{
        get {
            if(!this.HasProp("__HubDescriptor"))
                this.__HubDescriptor := USB_HUB_DESCRIPTOR(this.ptr + 0)
            return this.__HubDescriptor
        }
    }

    /**
     * @type {Integer}
     */
    HubIsBusPowered {
        get => NumGet(this, 72, "char")
        set => NumPut("char", value, this, 72)
    }
}
