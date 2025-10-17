#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CHROMATICITY_COORDINATE.ahk
#Include .\PANEL_BRIGHTNESS_SENSOR_DATA.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class PANEL_SET_BRIGHTNESS extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Level {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Millinits {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    TransitionTimeInMs {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {PANEL_BRIGHTNESS_SENSOR_DATA}
     */
    SensorData{
        get {
            if(!this.HasProp("__SensorData"))
                this.__SensorData := PANEL_BRIGHTNESS_SENSOR_DATA(16, this)
            return this.__SensorData
        }
    }
}
