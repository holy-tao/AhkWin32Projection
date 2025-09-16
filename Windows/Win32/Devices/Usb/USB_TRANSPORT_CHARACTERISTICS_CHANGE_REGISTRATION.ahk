#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USB_TRANSPORT_CHARACTERISTICS.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_TRANSPORT_CHARACTERISTICS_CHANGE_REGISTRATION extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ChangeNotificationInputFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<USB_CHANGE_REGISTRATION_HANDLE>}
     */
    Handle {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {USB_TRANSPORT_CHARACTERISTICS}
     */
    UsbTransportCharacteristics{
        get {
            if(!this.HasProp("__UsbTransportCharacteristics"))
                this.__UsbTransportCharacteristics := USB_TRANSPORT_CHARACTERISTICS(this.ptr + 16)
            return this.__UsbTransportCharacteristics
        }
    }
}
