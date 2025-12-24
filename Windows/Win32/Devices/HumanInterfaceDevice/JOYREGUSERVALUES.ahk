#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\JOYPOS.ahk
#Include .\JOYRANGE.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 */
class JOYREGUSERVALUES extends Win32Struct
{
    static sizeof => 100

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwTimeOut {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {JOYRANGE}
     */
    jrvRanges{
        get {
            if(!this.HasProp("__jrvRanges"))
                this.__jrvRanges := JOYRANGE(4, this)
            return this.__jrvRanges
        }
    }

    /**
     * @type {JOYPOS}
     */
    jpDeadZone{
        get {
            if(!this.HasProp("__jpDeadZone"))
                this.__jpDeadZone := JOYPOS(76, this)
            return this.__jpDeadZone
        }
    }
}
