#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Dvd
 */
export default struct DVD_LIST_OF_RECOGNIZED_FORMAT_LAYERS_TYPE_CODE {
    #StructPack 1

    NumberOfRecognizedFormatLayers : Int8

    /**
     * This bitfield backs the following members:
     * - OnlineFormatlayer
     * - Reserved1
     * - DefaultFormatLayer
     * - Reserved2
     */
    _bitfield : Int8


    /**
     * @type {Integer}
     */
    OnlineFormatlayer {
        get => (this._bitfield >> 0) & 0x3
        set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield >> 2) & 0x3
        set => this._bitfield := ((value & 0x3) << 2) | (this._bitfield & ~(0x3 << 2))
    }

    /**
     * @type {Integer}
     */
    DefaultFormatLayer {
        get => (this._bitfield >> 4) & 0x3
        set => this._bitfield := ((value & 0x3) << 4) | (this._bitfield & ~(0x3 << 4))
    }

    /**
     * @type {Integer}
     */
    Reserved2 {
        get => (this._bitfield >> 6) & 0x3
        set => this._bitfield := ((value & 0x3) << 6) | (this._bitfield & ~(0x3 << 6))
    }
}
