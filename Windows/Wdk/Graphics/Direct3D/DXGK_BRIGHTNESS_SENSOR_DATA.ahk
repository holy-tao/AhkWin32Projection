#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGK_BRIGHTNESS_SENSOR_DATA {
    #StructPack 8


    struct _Flags {
        /**
         * This bitfield backs the following members:
         * - AlsReadingValid
         * - ChromaticityValid
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
        ChromaticityValid {
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
    }

    Size : UInt32

    Flags : DXGK_BRIGHTNESS_SENSOR_DATA._Flags

    AlsReading : Float32

    Chromaticity : IntPtr

    ColorTemperature : Float32

    static __New() {
        DefineProp(this.Prototype, 'ValidSensorValues', { type: UInt32, offset: 4 })
        this.DeleteProp("__New")
    }
}
