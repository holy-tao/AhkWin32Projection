#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
class DIPOVCALIBRATION extends Win32Struct {
    static sizeof => 40

    static packingSize => 4

    /**
     * @type {Array<Integer>}
     */
    lMin {
        get {
            if(!this.HasProp("__lMinProxyArray"))
                this.__lMinProxyArray := Win32FixedArray(this.ptr + 0, 5, Primitive, "int")
            return this.__lMinProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    lMax {
        get {
            if(!this.HasProp("__lMaxProxyArray"))
                this.__lMaxProxyArray := Win32FixedArray(this.ptr + 20, 5, Primitive, "int")
            return this.__lMaxProxyArray
        }
    }
}
