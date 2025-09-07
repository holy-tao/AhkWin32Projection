#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CHROMATICITY_COORDINATE.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class PANEL_BRIGHTNESS_SENSOR_DATA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Anonymous {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Value {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Float}
     */
    AlsReading {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * @type {CHROMATICITY_COORDINATE}
     */
    ChromaticityCoordinate{
        get {
            if(!this.HasProp("__ChromaticityCoordinate"))
                this.__ChromaticityCoordinate := CHROMATICITY_COORDINATE(this.ptr + 8)
            return this.__ChromaticityCoordinate
        }
    }

    /**
     * @type {Float}
     */
    ColorTemperature {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }
}
