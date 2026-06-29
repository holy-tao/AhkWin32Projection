#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Dvd
 */
export default struct DVD_LAYER_DESCRIPTOR {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - BookVersion
     * - BookType
     */
    _bitfield1 : Int8


    /**
     * @type {Integer}
     */
    BookVersion {
        get => (this._bitfield1 >> 0) & 0xF
        set => this._bitfield1 := ((value & 0xF) << 0) | (this._bitfield1 & ~(0xF << 0))
    }

    /**
     * @type {Integer}
     */
    BookType {
        get => (this._bitfield1 >> 4) & 0xF
        set => this._bitfield1 := ((value & 0xF) << 4) | (this._bitfield1 & ~(0xF << 4))
    }
    /**
     * This bitfield backs the following members:
     * - MinimumRate
     * - DiskSize
     */
    _bitfield2 : Int8


    /**
     * @type {Integer}
     */
    MinimumRate {
        get => (this._bitfield2 >> 0) & 0xF
        set => this._bitfield2 := ((value & 0xF) << 0) | (this._bitfield2 & ~(0xF << 0))
    }

    /**
     * @type {Integer}
     */
    DiskSize {
        get => (this._bitfield2 >> 4) & 0xF
        set => this._bitfield2 := ((value & 0xF) << 4) | (this._bitfield2 & ~(0xF << 4))
    }
    /**
     * This bitfield backs the following members:
     * - LayerType
     * - TrackPath
     * - NumberOfLayers
     * - Reserved1
     */
    _bitfield3 : Int8


    /**
     * @type {Integer}
     */
    LayerType {
        get => (this._bitfield3 >> 0) & 0xF
        set => this._bitfield3 := ((value & 0xF) << 0) | (this._bitfield3 & ~(0xF << 0))
    }

    /**
     * @type {Integer}
     */
    TrackPath {
        get => (this._bitfield3 >> 4) & 0x1
        set => this._bitfield3 := ((value & 0x1) << 4) | (this._bitfield3 & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    NumberOfLayers {
        get => (this._bitfield3 >> 5) & 0x3
        set => this._bitfield3 := ((value & 0x3) << 5) | (this._bitfield3 & ~(0x3 << 5))
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield3 >> 7) & 0x1
        set => this._bitfield3 := ((value & 0x1) << 7) | (this._bitfield3 & ~(0x1 << 7))
    }
    /**
     * This bitfield backs the following members:
     * - TrackDensity
     * - LinearDensity
     */
    _bitfield4 : Int8


    /**
     * @type {Integer}
     */
    TrackDensity {
        get => (this._bitfield4 >> 0) & 0xF
        set => this._bitfield4 := ((value & 0xF) << 0) | (this._bitfield4 & ~(0xF << 0))
    }

    /**
     * @type {Integer}
     */
    LinearDensity {
        get => (this._bitfield4 >> 4) & 0xF
        set => this._bitfield4 := ((value & 0xF) << 4) | (this._bitfield4 & ~(0xF << 4))
    }
    StartingDataSector : UInt32

    EndDataSector : UInt32

    EndLayerZeroSector : UInt32

    /**
     * This bitfield backs the following members:
     * - Reserved5
     * - BCAFlag
     */
    _bitfield5 : Int8


    /**
     * @type {Integer}
     */
    Reserved5 {
        get => (this._bitfield5 >> 0) & 0x7F
        set => this._bitfield5 := ((value & 0x7F) << 0) | (this._bitfield5 & ~(0x7F << 0))
    }

    /**
     * @type {Integer}
     */
    BCAFlag {
        get => (this._bitfield5 >> 7) & 0x1
        set => this._bitfield5 := ((value & 0x1) << 7) | (this._bitfield5 & ~(0x1 << 7))
    }
}
