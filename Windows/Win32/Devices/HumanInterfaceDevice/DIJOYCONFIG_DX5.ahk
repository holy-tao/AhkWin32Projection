#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\JOYREGHWSETTINGS.ahk
#Include .\JOYPOS.ahk
#Include .\JOYRANGE.ahk
#Include .\JOYREGHWVALUES.ahk
#Include .\JOYREGHWCONFIG.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 */
class DIJOYCONFIG_DX5 extends Win32Struct
{
    static sizeof => 1168

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<Guid>}
     */
    guidInstance {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {JOYREGHWCONFIG}
     */
    hwc{
        get {
            if(!this.HasProp("__hwc"))
                this.__hwc := JOYREGHWCONFIG(this.ptr + 16)
            return this.__hwc
        }
    }

    /**
     * @type {Integer}
     */
    dwGain {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * @type {String}
     */
    wszType {
        get => StrGet(this.ptr + 140, 255, "UTF-16")
        set => StrPut(value, this.ptr + 140, 255, "UTF-16")
    }

    /**
     * @type {String}
     */
    wszCallout {
        get => StrGet(this.ptr + 652, 255, "UTF-16")
        set => StrPut(value, this.ptr + 652, 255, "UTF-16")
    }
}
