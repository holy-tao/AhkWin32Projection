#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USB_CHANGE_REGISTRATION_HANDLE.ahk
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
    Handle{
        get {
            if(!this.HasProp("__Handle"))
                this.__Handle := USB_CHANGE_REGISTRATION_HANDLE(this.ptr + 0)
            return this.__Handle
        }
    }

    /**
     * @type {USB_TRANSPORT_CHARACTERISTICS}
     */
    UsbTransportCharacteristics{
        get {
            if(!this.HasProp("__UsbTransportCharacteristics"))
                this.__UsbTransportCharacteristics := USB_TRANSPORT_CHARACTERISTICS(this.ptr + 8)
            return this.__UsbTransportCharacteristics
        }
    }
}
