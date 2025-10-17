#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USB_TRANSPORT_CHARACTERISTICS.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_TRANSPORT_CHARACTERISTICS_CHANGE_NOTIFICATION extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {USB_CHANGE_REGISTRATION_HANDLE}
     */
    Handle {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {USB_TRANSPORT_CHARACTERISTICS}
     */
    UsbTransportCharacteristics{
        get {
            if(!this.HasProp("__UsbTransportCharacteristics"))
                this.__UsbTransportCharacteristics := USB_TRANSPORT_CHARACTERISTICS(8, this)
            return this.__UsbTransportCharacteristics
        }
    }
}
