#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PANEL_BRIGHTNESS_SENSOR_DATA.ahk" { PANEL_BRIGHTNESS_SENSOR_DATA }
#Import ".\CHROMATICITY_COORDINATE.ahk" { CHROMATICITY_COORDINATE }
#Import ".\BRIGHTNESS_INTERFACE_VERSION.ahk" { BRIGHTNESS_INTERFACE_VERSION }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PANEL_SET_BRIGHTNESS {
    #StructPack 4

    Version : BRIGHTNESS_INTERFACE_VERSION

    Level : Int8

    TransitionTimeInMs : UInt32

    SensorData : PANEL_BRIGHTNESS_SENSOR_DATA

    static __New() {
        DefineProp(this.Prototype, 'Millinits', { type: UInt32, offset: 4 })
        this.DeleteProp("__New")
    }
}
