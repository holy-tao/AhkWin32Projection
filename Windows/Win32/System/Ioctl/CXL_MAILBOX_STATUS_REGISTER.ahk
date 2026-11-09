#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_MAILBOX_STATUS_REGISTER extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * This bitfield backs the following members:
     * - BackgroundOperation
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
    BackgroundOperation {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
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
