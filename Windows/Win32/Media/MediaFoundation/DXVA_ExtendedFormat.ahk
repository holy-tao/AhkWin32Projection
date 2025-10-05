#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVA_ExtendedFormat extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - SampleFormat
     * - VideoChromaSubsampling
     * - NominalRange
     * - VideoTransferMatrix
     * - VideoLighting
     * - VideoPrimaries
     * - VideoTransferFunction
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

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
