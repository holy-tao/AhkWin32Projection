#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA_ExtendedFormat {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - SampleFormat
     * - VideoChromaSubsampling
     * - NominalRange
     * - VideoTransferMatrix
     * - VideoLighting
     * - VideoPrimaries
     * - VideoTransferFunction
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    SampleFormat {
        get => (this._bitfield >> 0) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 0) | (this._bitfield & ~(0xFF << 0))
    }

    /**
     * @type {Integer}
     */
    VideoChromaSubsampling {
        get => (this._bitfield >> 8) & 0xF
        set => this._bitfield := ((value & 0xF) << 8) | (this._bitfield & ~(0xF << 8))
    }

    /**
     * @type {Integer}
     */
    NominalRange {
        get => (this._bitfield >> 12) & 0x7
        set => this._bitfield := ((value & 0x7) << 12) | (this._bitfield & ~(0x7 << 12))
    }

    /**
     * @type {Integer}
     */
    VideoTransferMatrix {
        get => (this._bitfield >> 15) & 0x7
        set => this._bitfield := ((value & 0x7) << 15) | (this._bitfield & ~(0x7 << 15))
    }

    /**
     * @type {Integer}
     */
    VideoLighting {
        get => (this._bitfield >> 18) & 0xF
        set => this._bitfield := ((value & 0xF) << 18) | (this._bitfield & ~(0xF << 18))
    }

    /**
     * @type {Integer}
     */
    VideoPrimaries {
        get => (this._bitfield >> 22) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 22) | (this._bitfield & ~(0x1F << 22))
    }

    /**
     * @type {Integer}
     */
    VideoTransferFunction {
        get => (this._bitfield >> 27) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 27) | (this._bitfield & ~(0x1F << 27))
    }
}
