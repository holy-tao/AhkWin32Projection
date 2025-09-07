#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USBFN_USB_STRING extends Win32Struct
{
    static sizeof => 512

    static packingSize => 2

    /**
     * @type {Integer}
     */
    StringIndex {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {String}
     */
    UsbString {
        get => StrGet(this.ptr + 2, 254, "UTF-16")
        set => StrPut(value, this.ptr + 2, 254, "UTF-16")
    }
}
