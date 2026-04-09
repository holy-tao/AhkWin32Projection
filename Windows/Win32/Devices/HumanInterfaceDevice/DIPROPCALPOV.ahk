#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DIPROPHEADER.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
class DIPROPCALPOV extends Win32Struct {
    static sizeof => 56

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
     * @type {Array<Integer>}
     */
    lMin {
        get {
            if(!this.HasProp("__lMinProxyArray"))
                this.__lMinProxyArray := Win32FixedArray(this.ptr + 16, 5, Primitive, "int")
            return this.__lMinProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    lMax {
        get {
            if(!this.HasProp("__lMaxProxyArray"))
                this.__lMaxProxyArray := Win32FixedArray(this.ptr + 36, 5, Primitive, "int")
            return this.__lMaxProxyArray
        }
    }
}
