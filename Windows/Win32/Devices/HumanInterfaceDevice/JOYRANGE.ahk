#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\JOYPOS.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 */
class JOYRANGE extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {JOYPOS}
     */
    jpMin{
        get {
            if(!this.HasProp("__jpMin"))
                this.__jpMin := JOYPOS(0, this)
            return this.__jpMin
        }
    }

    /**
     * @type {JOYPOS}
     */
    jpMax{
        get {
            if(!this.HasProp("__jpMax"))
                this.__jpMax := JOYPOS(24, this)
            return this.__jpMax
        }
    }

    /**
     * @type {JOYPOS}
     */
    jpCenter{
        get {
            if(!this.HasProp("__jpCenter"))
                this.__jpCenter := JOYPOS(48, this)
            return this.__jpCenter
        }
    }
}
