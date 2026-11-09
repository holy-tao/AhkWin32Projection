#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_RAS_ERROR_CAPABILITY_AND_CONTROL_REGISTER extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - FirstErrorPointer
     * - Reserved
     * - MultipleHeaderRecordingCapability
     * - Reserved2
     * - PoisonEnabled
     * - Reserved3
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    FirstErrorPointer {
        get => (this._bitfield >> 0) & 0x3F
        set => this._bitfield := ((value & 0x3F) << 0) | (this._bitfield & ~(0x3F << 0))
    }

    /**
     * @type {Integer}
     */
    MultipleHeaderRecordingCapability {
        get => (this._bitfield >> 9) & 0x1
        set => this._bitfield := ((value & 0x1) << 9) | (this._bitfield & ~(0x1 << 9))
    }

    /**
     * @type {Integer}
     */
    Reserved2 {
        get => (this._bitfield >> 10) & 0x7
        set => this._bitfield := ((value & 0x7) << 10) | (this._bitfield & ~(0x7 << 10))
    }

    /**
     * @type {Integer}
     */
    PoisonEnabled {
        get => (this._bitfield >> 13) & 0x1
        set => this._bitfield := ((value & 0x1) << 13) | (this._bitfield & ~(0x1 << 13))
    }

    /**
     * @type {Integer}
     */
    Reserved3 {
        get => (this._bitfield >> 14) & 0x3FFFF
        set => this._bitfield := ((value & 0x3FFFF) << 14) | (this._bitfield & ~(0x3FFFF << 14))
    }

    /**
     * @type {Integer}
     */
    AsUlong {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
