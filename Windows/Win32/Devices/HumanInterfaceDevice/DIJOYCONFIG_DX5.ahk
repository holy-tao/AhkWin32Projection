#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\JOYPOS.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\JOYREGHWSETTINGS.ahk
#Include .\JOYRANGE.ahk
#Include .\JOYREGHWVALUES.ahk
#Include .\JOYREGHWCONFIG.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
class DIJOYCONFIG_DX5 extends Win32Struct {
    static sizeof => 1160

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Guid}
     */
    guidInstance {
        get {
            if(!this.HasProp("__guidInstance"))
                this.__guidInstance := Guid(4, this)
            return this.__guidInstance
        }
    }

    /**
     * @type {JOYREGHWCONFIG}
     */
    hwc {
        get {
            if(!this.HasProp("__hwc"))
                this.__hwc := JOYREGHWCONFIG(20, this)
            return this.__hwc
        }
    }

    /**
     * @type {Integer}
     */
    dwGain {
        get => NumGet(this, 132, "uint")
        set => NumPut("uint", value, this, 132)
    }

    /**
     * @type {String}
     */
    wszType {
        get => StrGet(this.ptr + 136, 255, "UTF-16")
        set => StrPut(value, this.ptr + 136, 255, "UTF-16")
    }

    /**
     * @type {String}
     */
    wszCallout {
        get => StrGet(this.ptr + 648, 255, "UTF-16")
        set => StrPut(value, this.ptr + 648, 255, "UTF-16")
    }
}
