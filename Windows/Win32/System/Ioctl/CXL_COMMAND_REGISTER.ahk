#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_COMMAND_REGISTER extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * This bitfield backs the following members:
     * - CommandOpcode
     * - PayloadLength
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
    CommandOpcode {
        get => (this._bitfield >> 0) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 0) | (this._bitfield & ~(0xFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    PayloadLength {
        get => (this._bitfield >> 16) & 0x1FFFFF
        set => this._bitfield := ((value & 0x1FFFFF) << 16) | (this._bitfield & ~(0x1FFFFF << 16))
    }

    /**
     * @type {Integer}
     */
    AsUlonglong {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
