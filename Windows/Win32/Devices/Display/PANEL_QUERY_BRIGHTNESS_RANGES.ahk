#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BRIGHTNESS_NIT_RANGES.ahk
#Include .\BRIGHTNESS_LEVEL.ahk
#Include .\BRIGHTNESS_NIT_RANGE.ahk
#Include .\BRIGHTNESS_INTERFACE_VERSION.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 */
class PANEL_QUERY_BRIGHTNESS_RANGES extends Win32Struct {
    static sizeof => 208

    static packingSize => 4

    /**
     * @type {BRIGHTNESS_INTERFACE_VERSION}
     */
    Version {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {BRIGHTNESS_LEVEL}
     */
    BrightnessLevel {
        get {
            if(!this.HasProp("__BrightnessLevel"))
                this.__BrightnessLevel := BRIGHTNESS_LEVEL(4, this)
            return this.__BrightnessLevel
        }
    }

    /**
     * @type {BRIGHTNESS_NIT_RANGES}
     */
    NitRanges {
        get {
            if(!this.HasProp("__NitRanges"))
                this.__NitRanges := BRIGHTNESS_NIT_RANGES(4, this)
            return this.__NitRanges
        }
    }
}
