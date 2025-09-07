#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class DISPLAY_BRIGHTNESS extends Win32Struct
{
    static sizeof => 3

    static packingSize => 1

    /**
     * @type {Integer}
     */
    ucDisplayPolicy {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ucACBrightness {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    ucDCBrightness {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }
}
