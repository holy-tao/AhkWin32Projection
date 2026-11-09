#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_MAILBOX_GET_POISON_LIST_INPUT extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * This bitfield backs the following members:
     * - RestartRequest
     * - Reserved
     * - PhysicalAddress
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    RestartRequest {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    PhysicalAddress {
        get => (this._bitfield >> 6) & 0x3FFFFFFFFFFFFFF
        set => this._bitfield := ((value & 0x3FFFFFFFFFFFFFF) << 6) | (this._bitfield & ~(0x3FFFFFFFFFFFFFF << 6))
    }

    /**
     * @type {Integer}
     */
    PhysicalAddressLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
