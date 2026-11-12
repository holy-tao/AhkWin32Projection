#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_HDM_DECODER_TARGET_LIST_LOW_REGISTER extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - TargetPortIdentifierForInterleaveWayIs0
     * - TargetPortIdentifierForInterleaveWayIs1
     * - TargetPortIdentifierForInterleaveWayIs2
     * - TargetPortIdentifierForInterleaveWayIs3
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    TargetPortIdentifierForInterleaveWayIs0 {
        get => (this._bitfield >> 0) & 0xF
        set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
    }

    /**
     * @type {Integer}
     */
    TargetPortIdentifierForInterleaveWayIs1 {
        get => (this._bitfield >> 4) & 0xF
        set => this._bitfield := ((value & 0xF) << 4) | (this._bitfield & ~(0xF << 4))
    }

    /**
     * @type {Integer}
     */
    TargetPortIdentifierForInterleaveWayIs2 {
        get => (this._bitfield >> 8) & 0xF
        set => this._bitfield := ((value & 0xF) << 8) | (this._bitfield & ~(0xF << 8))
    }

    /**
     * @type {Integer}
     */
    TargetPortIdentifierForInterleaveWayIs3 {
        get => (this._bitfield >> 12) & 0xF
        set => this._bitfield := ((value & 0xF) << 12) | (this._bitfield & ~(0xF << 12))
    }

    /**
     * @type {Integer}
     */
    AsUlong {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
