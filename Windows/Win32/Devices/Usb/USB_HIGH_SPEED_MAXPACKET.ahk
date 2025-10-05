#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_HIGH_SPEED_MAXPACKET extends Win32Struct
{
    static sizeof => 2

    static packingSize => 1

    /**
     * @type {Integer}
     */
    us {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }
}
