#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_X64_PENDING_INTERRUPTION_REGISTER {
    #StructPack 8

    /**
     * This bitfield backs the following members:
     * - InterruptionPending
     * - InterruptionType
     * - DeliverErrorCode
     * - InstructionLength
     * - NestedEvent
     * - Reserved
     * - InterruptionVector
     */
    _bitfield : Int32


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
    InterruptionVector {
        get => (this._bitfield >> 16) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 16) | (this._bitfield & ~(0xFFFF << 16))
    }
    ErrorCode : UInt32

    static __New() {
        DefineProp(this.Prototype, 'AsUINT64', { type: Int64, offset: 0 })
        this.DeleteProp("__New")
    }
}
