#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WHV_UINT128.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @architecture X64
 */
class WHV_X64_PENDING_SVM_NESTED_EXIT_EVENT0 extends Win32Struct {
    static sizeof => 48

    static packingSize => 8

    /**
     * This bitfield backs the following members:
     * - EventPending
     * - EventType
     * - Reserved0
     * - InstructionBytesValid
     * - Reserved1
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    EventPending {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    EventType {
        get => (this._bitfield >> 1) & 0xF
        set => this._bitfield := ((value & 0xF) << 1) | (this._bitfield & ~(0xF << 1))
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 5) & 0x7
        set => this._bitfield := ((value & 0x7) << 5) | (this._bitfield & ~(0x7 << 5))
    }

    /**
     * @type {Integer}
     */
    InstructionBytesValid {
        get => (this._bitfield >> 8) & 0x1
        set => this._bitfield := ((value & 0x1) << 8) | (this._bitfield & ~(0x1 << 8))
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield >> 9) & 0x7FFFFFFFFFFFFF
        set => this._bitfield := ((value & 0x7FFFFFFFFFFFFF) << 9) | (this._bitfield & ~(0x7FFFFFFFFFFFFF << 9))
    }

    /**
     * @type {Integer}
     */
    ExitCode {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {WHV_UINT128}
     */
    AsUINT128 {
        get {
            if(!this.HasProp("__AsUINT128"))
                this.__AsUINT128 := WHV_UINT128(0, this)
            return this.__AsUINT128
        }
    }
}
