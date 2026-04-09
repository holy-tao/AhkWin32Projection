#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_BRIGHTNESS_POSSIBLE_LEVELS extends Win32Struct {
    static sizeof => 257

    static packingSize => 1

    /**
     * @type {Integer}
     */
    LevelCount {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Array<Integer>}
     */
    BrightnessLevels {
        get {
            if(!this.HasProp("__BrightnessLevelsProxyArray"))
                this.__BrightnessLevelsProxyArray := Win32FixedArray(this.ptr + 1, 256, Primitive, "char")
            return this.__BrightnessLevelsProxyArray
        }
    }
}
