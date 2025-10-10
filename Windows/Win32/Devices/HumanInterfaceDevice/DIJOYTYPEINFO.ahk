#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\JOYREGHWSETTINGS.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 */
class DIJOYTYPEINFO extends Win32Struct
{
    static sizeof => 2088

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {JOYREGHWSETTINGS}
     */
    hws{
        get {
            if(!this.HasProp("__hws"))
                this.__hws := JOYREGHWSETTINGS(this.ptr + 8)
            return this.__hws
        }
    }

    /**
     * @type {Pointer<Guid>}
     */
    clsidConfig {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {String}
     */
    wszDisplayName {
        get => StrGet(this.ptr + 24, 255, "UTF-16")
        set => StrPut(value, this.ptr + 24, 255, "UTF-16")
    }

    /**
     * @type {String}
     */
    wszCallout {
        get => StrGet(this.ptr + 536, 259, "UTF-16")
        set => StrPut(value, this.ptr + 536, 259, "UTF-16")
    }

    /**
     * @type {String}
     */
    wszHardwareId {
        get => StrGet(this.ptr + 1056, 255, "UTF-16")
        set => StrPut(value, this.ptr + 1056, 255, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dwFlags1 {
        get => NumGet(this, 1568, "uint")
        set => NumPut("uint", value, this, 1568)
    }

    /**
     * @type {Integer}
     */
    dwFlags2 {
        get => NumGet(this, 1572, "uint")
        set => NumPut("uint", value, this, 1572)
    }

    /**
     * @type {String}
     */
    wszMapFile {
        get => StrGet(this.ptr + 1576, 255, "UTF-16")
        set => StrPut(value, this.ptr + 1576, 255, "UTF-16")
    }
}
