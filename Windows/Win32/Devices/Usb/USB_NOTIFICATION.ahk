#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USB_NOTIFICATION_TYPE.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 */
class USB_NOTIFICATION extends Win32Struct {
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {USB_NOTIFICATION_TYPE}
     */
    NotificationType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
