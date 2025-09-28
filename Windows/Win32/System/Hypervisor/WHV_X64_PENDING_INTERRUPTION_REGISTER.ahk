#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_X64_PENDING_INTERRUPTION_REGISTER extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * This bitfield backs the following members:
     * - InterruptionPending
     * - InterruptionType
     * - DeliverErrorCode
     * - InstructionLength
     * - NestedEvent
     * - Reserved
     * - InterruptionVector
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    InterruptionPending {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    InterruptionType {
        get => (this._bitfield >> 1) & 0x7
        set => this._bitfield := ((value & 0x7) << 1) | (this._bitfield & ~(0x7 << 1))
    }

    /**
     * @type {Integer}
     */
    DeliverErrorCode {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    InstructionLength {
        get => (this._bitfield >> 5) & 0xF
        set => this._bitfield := ((value & 0xF) << 5) | (this._bitfield & ~(0xF << 5))
    }

    /**
     * @type {Integer}
     */
    NestedEvent {
        get => (this._bitfield >> 9) & 0x1
        set => this._bitfield := ((value & 0x1) << 9) | (this._bitfield & ~(0x1 << 9))
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => (this._bitfield >> 10) & 0x3F
        set => this._bitfield := ((value & 0x3F) << 10) | (this._bitfield & ~(0x3F << 10))
    }

    /**
     * @type {Integer}
     */
    InterruptionVector {
        get => (this._bitfield >> 16) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 16) | (this._bitfield & ~(0xFFFF << 16))
    }

    /**
     * @type {Integer}
     */
    ErrorCode {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    AsUINT64 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
