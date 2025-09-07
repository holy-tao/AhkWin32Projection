#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_FUNCTION_SUSPEND_OPTIONS extends Win32Struct
{
    static sizeof => 2

    static packingSize => 1

    /**
     * @type {Integer}
     */
    AsUchar {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Anonymous {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }
}
