#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BRIGHTNESS_LEVEL.ahk" { BRIGHTNESS_LEVEL }
#Import ".\BRIGHTNESS_NIT_RANGES.ahk" { BRIGHTNESS_NIT_RANGES }
#Import ".\BRIGHTNESS_INTERFACE_VERSION.ahk" { BRIGHTNESS_INTERFACE_VERSION }
#Import ".\BRIGHTNESS_NIT_RANGE.ahk" { BRIGHTNESS_NIT_RANGE }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PANEL_QUERY_BRIGHTNESS_RANGES {
    #StructPack 4

    Version : BRIGHTNESS_INTERFACE_VERSION

    BrightnessLevel : BRIGHTNESS_LEVEL

    static __New() {
        DefineProp(this.Prototype, 'NitRanges', { type: BRIGHTNESS_NIT_RANGES, offset: 4 })
        this.DeleteProp("__New")
    }
}
