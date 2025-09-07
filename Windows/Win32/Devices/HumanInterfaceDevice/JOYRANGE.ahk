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
                this.__jpMin := JOYPOS(this.ptr + 0)
            return this.__jpMin
        }
    }

    /**
     * @type {JOYPOS}
     */
    jpMax{
        get {
            if(!this.HasProp("__jpMax"))
                this.__jpMax := JOYPOS(this.ptr + 24)
            return this.__jpMax
        }
    }

    /**
     * @type {JOYPOS}
     */
    jpCenter{
        get {
            if(!this.HasProp("__jpCenter"))
                this.__jpCenter := JOYPOS(this.ptr + 48)
            return this.__jpCenter
        }
    }
}
