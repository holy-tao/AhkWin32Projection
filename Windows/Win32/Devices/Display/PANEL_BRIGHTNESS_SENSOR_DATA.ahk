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
     * This bitfield backs the following members:
     * - AlsReadingValid
     * - ChromaticityCoordinateValid
     * - ColorTemperatureValid
     * - Reserved
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    AlsReadingValid {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    ChromaticityCoordinateValid {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    ColorTemperatureValid {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
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
                this.__ChromaticityCoordinate := CHROMATICITY_COORDINATE(8, this)
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
