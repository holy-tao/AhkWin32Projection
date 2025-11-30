#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DDDI_SEGMENTPREFERENCE extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - SegmentId0
     * - Direction0
     * - SegmentId1
     * - Direction1
     * - SegmentId2
     * - Direction2
     * - SegmentId3
     * - Direction3
     * - SegmentId4
     * - Direction4
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
    SegmentId0 {
        get => (this._bitfield >> 0) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 0) | (this._bitfield & ~(0x1F << 0))
    }

    /**
     * @type {Integer}
     */
    Direction0 {
        get => (this._bitfield >> 5) & 0x1
        set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
    }

    /**
     * @type {Integer}
     */
    SegmentId1 {
        get => (this._bitfield >> 6) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 6) | (this._bitfield & ~(0x1F << 6))
    }

    /**
     * @type {Integer}
     */
    Direction1 {
        get => (this._bitfield >> 11) & 0x1
        set => this._bitfield := ((value & 0x1) << 11) | (this._bitfield & ~(0x1 << 11))
    }

    /**
     * @type {Integer}
     */
    SegmentId2 {
        get => (this._bitfield >> 12) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 12) | (this._bitfield & ~(0x1F << 12))
    }

    /**
     * @type {Integer}
     */
    Direction2 {
        get => (this._bitfield >> 17) & 0x1
        set => this._bitfield := ((value & 0x1) << 17) | (this._bitfield & ~(0x1 << 17))
    }

    /**
     * @type {Integer}
     */
    SegmentId3 {
        get => (this._bitfield >> 18) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 18) | (this._bitfield & ~(0x1F << 18))
    }

    /**
     * @type {Integer}
     */
    Direction3 {
        get => (this._bitfield >> 23) & 0x1
        set => this._bitfield := ((value & 0x1) << 23) | (this._bitfield & ~(0x1 << 23))
    }

    /**
     * @type {Integer}
     */
    SegmentId4 {
        get => (this._bitfield >> 24) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 24) | (this._bitfield & ~(0x1F << 24))
    }

    /**
     * @type {Integer}
     */
    Direction4 {
        get => (this._bitfield >> 29) & 0x1
        set => this._bitfield := ((value & 0x1) << 29) | (this._bitfield & ~(0x1 << 29))
    }

    /**
     * @type {Integer}
     */
    Value {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
