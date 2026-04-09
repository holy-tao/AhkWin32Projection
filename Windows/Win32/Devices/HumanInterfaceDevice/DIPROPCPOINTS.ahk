#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DIPROPHEADER.ahk
#Include .\CPOINT.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
class DIPROPCPOINTS extends Win32Struct {
    static sizeof => 84

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
     * @type {Integer}
     */
    dwCPointsNum {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {CPOINT}
     */
    cp {
        get {
            if(!this.HasProp("__cpProxyArray"))
                this.__cpProxyArray := Win32FixedArray(this.ptr + 20, 8, CPOINT, "")
            return this.__cpProxyArray
        }
    }
}
