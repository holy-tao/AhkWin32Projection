#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USB_NOTIFICATION_TYPE.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 */
class USB_BUS_NOTIFICATION extends Win32Struct {
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {USB_NOTIFICATION_TYPE}
     */
    NotificationType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    TotalBandwidth {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    ConsumedBandwidth {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ControllerNameLength {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
