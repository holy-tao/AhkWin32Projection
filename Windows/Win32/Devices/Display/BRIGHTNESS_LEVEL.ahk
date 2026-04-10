#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 */
class BRIGHTNESS_LEVEL extends Win32Struct {
    static sizeof => 104

    static packingSize => 1

    /**
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Array<Integer>}
     */
    Level {
        get {
            if(!this.HasProp("__LevelProxyArray"))
                this.__LevelProxyArray := Win32FixedArray(this.ptr + 1, 103, Primitive, "char")
            return this.__LevelProxyArray
        }
    }
}
