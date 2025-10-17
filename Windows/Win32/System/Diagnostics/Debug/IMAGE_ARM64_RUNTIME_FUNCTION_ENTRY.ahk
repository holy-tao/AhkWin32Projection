#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class IMAGE_ARM64_RUNTIME_FUNCTION_ENTRY extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    BeginAddress {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    UnwindData {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * This bitfield backs the following members:
     * - Flag
     * - FunctionLength
     * - RegF
     * - RegI
     * - H
     * - CR
     * - FrameSize
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Flag {
        get => (this._bitfield >> 0) & 0x3
        set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
    }

    /**
     * @type {Integer}
     */
    FunctionLength {
        get => (this._bitfield >> 2) & 0x7FF
        set => this._bitfield := ((value & 0x7FF) << 2) | (this._bitfield & ~(0x7FF << 2))
    }

    /**
     * @type {Integer}
     */
    RegF {
        get => (this._bitfield >> 13) & 0x7
        set => this._bitfield := ((value & 0x7) << 13) | (this._bitfield & ~(0x7 << 13))
    }

    /**
     * @type {Integer}
     */
    RegI {
        get => (this._bitfield >> 16) & 0xF
        set => this._bitfield := ((value & 0xF) << 16) | (this._bitfield & ~(0xF << 16))
    }

    /**
     * @type {Integer}
     */
    H {
        get => (this._bitfield >> 20) & 0x1
        set => this._bitfield := ((value & 0x1) << 20) | (this._bitfield & ~(0x1 << 20))
    }

    /**
     * @type {Integer}
     */
    CR {
        get => (this._bitfield >> 21) & 0x3
        set => this._bitfield := ((value & 0x3) << 21) | (this._bitfield & ~(0x3 << 21))
    }

    /**
     * @type {Integer}
     */
    FrameSize {
        get => (this._bitfield >> 23) & 0x1FF
        set => this._bitfield := ((value & 0x1FF) << 23) | (this._bitfield & ~(0x1FF << 23))
    }
}
