#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DISPLAYID_DETAILED_TIMING_TYPE_I {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - PixelClock
     * - AspectRatio
     * - Reserved
     * - ScanningType
     * - StereoMode
     * - PreferredTiming
     */
    _bitfield : Int32


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
    HorizontalActivePixels : UInt16

    HorizontalBlankPixels : UInt16

    /**
     * This bitfield backs the following members:
     * - HorizontalFrontPorch
     * - HorizontalSyncPolarity
     */
    _bitfield1 : Int16


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
    HorizontalSyncWidth : UInt16

    VerticalActiveLines : UInt16

    VerticalBlankLines : UInt16

    /**
     * This bitfield backs the following members:
     * - VerticalFrontPorch
     * - VerticalSyncPolarity
     */
    _bitfield2 : Int16


    /**
     * @type {Integer}
     */
    VerticalFrontPorch {
        get => (this._bitfield2 >> 0) & 0x7FFF
        set => this._bitfield2 := ((value & 0x7FFF) << 0) | (this._bitfield2 & ~(0x7FFF << 0))
    }

    /**
     * @type {Integer}
     */
    VerticalSyncPolarity {
        get => (this._bitfield2 >> 15) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 15) | (this._bitfield2 & ~(0x1 << 15))
    }
    VerticalSyncWidth : UInt16

}
