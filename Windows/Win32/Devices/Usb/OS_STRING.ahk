#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class OS_STRING extends Win32Struct
{
    static sizeof => 18

    static packingSize => 2

    /**
     * @type {Integer}
     */
    bLength {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    bDescriptorType {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {String}
     */
    MicrosoftString {
        get => StrGet(this.ptr + 2, 6, "UTF-16")
        set => StrPut(value, this.ptr + 2, 6, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    bVendorCode {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    bPad {
        get => NumGet(this, 17, "char")
        set => NumPut("char", value, this, 17)
    }

    /**
     * @type {Integer}
     */
    bFlags {
        get => NumGet(this, 17, "char")
        set => NumPut("char", value, this, 17)
    }
}
