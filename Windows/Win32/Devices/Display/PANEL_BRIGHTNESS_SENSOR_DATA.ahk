#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CHROMATICITY_COORDINATE.ahk" { CHROMATICITY_COORDINATE }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PANEL_BRIGHTNESS_SENSOR_DATA {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - AlsReadingValid
     * - ChromaticityCoordinateValid
     * - ColorTemperatureValid
     * - Reserved
     */
    _bitfield : Int32


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
    AlsReading : Float32

    ChromaticityCoordinate : CHROMATICITY_COORDINATE

    ColorTemperature : Float32

    static __New() {
        DefineProp(this.Prototype, 'Value', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
