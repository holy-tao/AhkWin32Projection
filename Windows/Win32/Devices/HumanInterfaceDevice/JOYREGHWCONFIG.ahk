#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\JOYREGHWSETTINGS.ahk
#Include .\JOYPOS.ahk
#Include .\JOYRANGE.ahk
#Include .\JOYREGHWVALUES.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 */
class JOYREGHWCONFIG extends Win32Struct
{
    static sizeof => 120

    static packingSize => 8

    /**
     * @type {JOYREGHWSETTINGS}
     */
    hws{
        get {
            if(!this.HasProp("__hws"))
                this.__hws := JOYREGHWSETTINGS(this.ptr + 0)
            return this.__hws
        }
    }

    /**
     * @type {Integer}
     */
    dwUsageSettings {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {JOYREGHWVALUES}
     */
    hwv{
        get {
            if(!this.HasProp("__hwv"))
                this.__hwv := JOYREGHWVALUES(this.ptr + 16)
            return this.__hwv
        }
    }

    /**
     * @type {Integer}
     */
    dwType {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 116, "uint")
        set => NumPut("uint", value, this, 116)
    }
}
