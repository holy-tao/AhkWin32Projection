#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMDT_WIRE_FORMAT_AND_PREFERENCE {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - Preference
     * - Rgb
     * - YCbCr444
     * - YCbCr422
     * - YCbCr420
     * - Intensity
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    Preference {
        get => (this._bitfield >> 0) & 0x3
        set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
    }

    /**
     * @type {Integer}
     */
    Rgb {
        get => (this._bitfield >> 2) & 0x3F
        set => this._bitfield := ((value & 0x3F) << 2) | (this._bitfield & ~(0x3F << 2))
    }

    /**
     * @type {Integer}
     */
    YCbCr444 {
        get => (this._bitfield >> 8) & 0x3F
        set => this._bitfield := ((value & 0x3F) << 8) | (this._bitfield & ~(0x3F << 8))
    }

    /**
     * @type {Integer}
     */
    YCbCr422 {
        get => (this._bitfield >> 14) & 0x3F
        set => this._bitfield := ((value & 0x3F) << 14) | (this._bitfield & ~(0x3F << 14))
    }

    /**
     * @type {Integer}
     */
    YCbCr420 {
        get => (this._bitfield >> 20) & 0x3F
        set => this._bitfield := ((value & 0x3F) << 20) | (this._bitfield & ~(0x3F << 20))
    }

    /**
     * @type {Integer}
     */
    Intensity {
        get => (this._bitfield >> 26) & 0x3F
        set => this._bitfield := ((value & 0x3F) << 26) | (this._bitfield & ~(0x3F << 26))
    }
    static __New() {
        DefineProp(this.Prototype, 'Value', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
