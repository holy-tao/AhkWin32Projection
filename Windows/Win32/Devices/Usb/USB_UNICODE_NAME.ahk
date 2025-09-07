#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The USB_UNICODE_NAME structure contains a Unicode string that specifies a symbolic link name.
 * @see https://learn.microsoft.com/windows/win32/api/usbuser/ns-usbuser-usb_unicode_name
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_UNICODE_NAME extends Win32Struct
{
    static sizeof => 6

    static packingSize => 1

    /**
     * The length, in bytes, of the string.
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to the string.
     * @type {String}
     */
    String {
        get => StrGet(this.ptr + 4, 0, "UTF-16")
        set => StrPut(value, this.ptr + 4, 0, "UTF-16")
    }
}
