#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

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
     * @type {BOOLEAN}
     */
    IsCurrent{
        get {
            if(!this.HasProp("__IsCurrent"))
                this.__IsCurrent := BOOLEAN(this.ptr + 80)
            return this.__IsCurrent
        }
    }

    /**
     * @type {BOOLEAN}
     */
    IsActive{
        get {
            if(!this.HasProp("__IsActive"))
                this.__IsActive := BOOLEAN(this.ptr + 81)
            return this.__IsActive
        }
    }
}
