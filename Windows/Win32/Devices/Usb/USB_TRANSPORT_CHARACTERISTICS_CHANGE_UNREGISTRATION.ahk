#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_TRANSPORT_CHARACTERISTICS_CHANGE_UNREGISTRATION extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {USB_CHANGE_REGISTRATION_HANDLE}
     */
    Handle {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
