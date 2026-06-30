#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\JOYREGHWSETTINGS.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
class DIJOYTYPEINFO_DX6 extends Win32Struct {
    static sizeof => 1576

    static packingSize => 4

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
    hws {
        get {
            if(!this.HasProp("__hws"))
                this.__hws := JOYREGHWSETTINGS(4, this)
            return this.__hws
        }
    }

    /**
     * @type {Guid}
     */
    clsidConfig {
        get {
            if(!this.HasProp("__clsidConfig"))
                this.__clsidConfig := Guid(12, this)
            return this.__clsidConfig
        }
    }

    /**
     * @type {String}
     */
    wszDisplayName {
        get => StrGet(this.ptr + 28, 255, "UTF-16")
        set => StrPut(value, this.ptr + 28, 255, "UTF-16")
    }

    /**
     * @type {String}
     */
    wszCallout {
        get => StrGet(this.ptr + 540, 259, "UTF-16")
        set => StrPut(value, this.ptr + 540, 259, "UTF-16")
    }

    /**
     * @type {String}
     */
    wszHardwareId {
        get => StrGet(this.ptr + 1060, 255, "UTF-16")
        set => StrPut(value, this.ptr + 1060, 255, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dwFlags1 {
        get => NumGet(this, 1572, "uint")
        set => NumPut("uint", value, this, 1572)
    }
}
