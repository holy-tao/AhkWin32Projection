#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USBFN_BUS_CONFIGURATION_INFO extends Win32Struct
{
    static sizeof => 82

    static packingSize => 2

    /**
     * @type {String}
     */
    ConfigurationName {
        get => StrGet(this.ptr + 0, 39, "UTF-16")
        set => StrPut(value, this.ptr + 0, 39, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    IsCurrent {
        get => NumGet(this, 80, "char")
        set => NumPut("char", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    IsActive {
        get => NumGet(this, 81, "char")
        set => NumPut("char", value, this, 81)
    }
}
