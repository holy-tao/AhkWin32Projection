#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_BACKGROUND_COMMAND_STATUS_REGISTER extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * This bitfield backs the following members:
     * - CommandOpcode
     * - PercentageComplete
     * - Reserved
     * - ReturnCode
     * - VendorSpecificExtendedStatus
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    CommandOpcode {
        get => (this._bitfield >> 0) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 0) | (this._bitfield & ~(0xFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    PercentageComplete {
        get => (this._bitfield >> 16) & 0x7F
        set => this._bitfield := ((value & 0x7F) << 16) | (this._bitfield & ~(0x7F << 16))
    }

    /**
     * @type {Integer}
     */
    ReturnCode {
        get => (this._bitfield >> 32) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 32) | (this._bitfield & ~(0xFFFF << 32))
    }

    /**
     * @type {Integer}
     */
    VendorSpecificExtendedStatus {
        get => (this._bitfield >> 48) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 48) | (this._bitfield & ~(0xFFFF << 48))
    }

    /**
     * @type {Integer}
     */
    AsUlonglong {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
