#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class DISPLAYID_DETAILED_TIMING_TYPE_I extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - PixelClock
     * - AspectRatio
     * - Reserved
     * - ScanningType
     * - StereoMode
     * - PreferredTiming
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    PixelClock {
        get => (this._bitfield >> 0) & 0xFFFFFF
        set => this._bitfield := ((value & 0xFFFFFF) << 0) | (this._bitfield & ~(0xFFFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    AspectRatio {
        get => (this._bitfield >> 24) & 0x7
        set => this._bitfield := ((value & 0x7) << 24) | (this._bitfield & ~(0x7 << 24))
    }

    /**
     * @type {Integer}
     */
    ScanningType {
        get => (this._bitfield >> 28) & 0x1
        set => this._bitfield := ((value & 0x1) << 28) | (this._bitfield & ~(0x1 << 28))
    }

    /**
     * @type {Integer}
     */
    StereoMode {
        get => (this._bitfield >> 29) & 0x3
        set => this._bitfield := ((value & 0x3) << 29) | (this._bitfield & ~(0x3 << 29))
    }

    /**
     * @type {Integer}
     */
    PreferredTiming {
        get => (this._bitfield >> 31) & 0x1
        set => this._bitfield := ((value & 0x1) << 31) | (this._bitfield & ~(0x1 << 31))
    }

    /**
     * @type {Integer}
     */
    HorizontalActivePixels {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    HorizontalBlankPixels {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * This bitfield backs the following members:
     * - HorizontalFrontPorch
     * - HorizontalSyncPolarity
     * @type {Integer}
     */
    _bitfield1 {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    HorizontalFrontPorch {
        get => (this._bitfield1 >> 0) & 0x7FFF
        set => this._bitfield1 := ((value & 0x7FFF) << 0) | (this._bitfield1 & ~(0x7FFF << 0))
    }

    /**
     * @type {Integer}
     */
    HorizontalSyncPolarity {
        get => (this._bitfield1 >> 15) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 15) | (this._bitfield1 & ~(0x1 << 15))
    }

    /**
     * @type {Integer}
     */
    HorizontalSyncWidth {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * @type {Integer}
     */
    VerticalActiveLines {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    VerticalBlankLines {
        get => NumGet(this, 14, "ushort")
        set => NumPut("ushort", value, this, 14)
    }

    /**
     * This bitfield backs the following members:
     * - VerticalFrontPorch
     * - VerticalSyncPolarity
     * @type {Integer}
     */
    _bitfield12 {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    VerticalFrontPorch {
        get => (this._bitfield12 >> 0) & 0x7FFF
        set => this._bitfield12 := ((value & 0x7FFF) << 0) | (this._bitfield12 & ~(0x7FFF << 0))
    }

    /**
     * @type {Integer}
     */
    VerticalSyncPolarity {
        get => (this._bitfield12 >> 15) & 0x1
        set => this._bitfield12 := ((value & 0x1) << 15) | (this._bitfield12 & ~(0x1 << 15))
    }

    /**
     * @type {Integer}
     */
    VerticalSyncWidth {
        get => NumGet(this, 18, "ushort")
        set => NumPut("ushort", value, this, 18)
    }
}
