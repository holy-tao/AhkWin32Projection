#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Dvd
 * @version v4.0.30319
 */
class DVD_LAYER_DESCRIPTOR extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - BookVersion
     * - BookType
     * @type {Integer}
     */
    _bitfield1 {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

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
     * @type {Integer}
     */
    _bitfield2 {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

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
     * @type {Integer}
     */
    _bitfield3 {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

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
     * @type {Integer}
     */
    _bitfield4 {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

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

    /**
     * @type {Integer}
     */
    StartingDataSector {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    EndDataSector {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    EndLayerZeroSector {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * This bitfield backs the following members:
     * - Reserved5
     * - BCAFlag
     * @type {Integer}
     */
    _bitfield5 {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

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
