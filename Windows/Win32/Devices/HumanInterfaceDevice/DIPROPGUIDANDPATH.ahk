#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DIPROPHEADER.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
class DIPROPGUIDANDPATH extends Win32Struct {
    static sizeof => 552

    static packingSize => 4

    /**
     * @type {DIPROPHEADER}
     */
    diph {
        get {
            if(!this.HasProp("__diph"))
                this.__diph := DIPROPHEADER(0, this)
            return this.__diph
        }
    }

    /**
     * @type {Guid}
     */
    guidClass {
        get {
            if(!this.HasProp("__guidClass"))
                this.__guidClass := Guid(16, this)
            return this.__guidClass
        }
    }

    /**
     * @type {String}
     */
    wszPath {
        get => StrGet(this.ptr + 32, 259, "UTF-16")
        set => StrPut(value, this.ptr + 32, 259, "UTF-16")
    }
}
