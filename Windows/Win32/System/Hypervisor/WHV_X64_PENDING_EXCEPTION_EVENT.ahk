#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHV_UINT128.ahk" { WHV_UINT128 }

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_X64_PENDING_EXCEPTION_EVENT {
    #StructPack 8

    /**
     * This bitfield backs the following members:
     * - EventPending
     * - EventType
     * - Reserved0
     * - DeliverErrorCode
     * - Reserved1
     * - Vector
     */
    _bitfield : Int32


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
        get => (this._bitfield >> 1) & 0x7
        set => this._bitfield := ((value & 0x7) << 1) | (this._bitfield & ~(0x7 << 1))
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 4) & 0xF
        set => this._bitfield := ((value & 0xF) << 4) | (this._bitfield & ~(0xF << 4))
    }

    /**
     * @type {Integer}
     */
    DeliverErrorCode {
        get => (this._bitfield >> 8) & 0x1
        set => this._bitfield := ((value & 0x1) << 8) | (this._bitfield & ~(0x1 << 8))
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield >> 9) & 0x7F
        set => this._bitfield := ((value & 0x7F) << 9) | (this._bitfield & ~(0x7F << 9))
    }

    /**
     * @type {Integer}
     */
    Vector {
        get => (this._bitfield >> 16) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 16) | (this._bitfield & ~(0xFFFF << 16))
    }
    ErrorCode : UInt32

    ExceptionParameter : Int64

    static __New() {
        DefineProp(this.Prototype, 'AsUINT128', { type: WHV_UINT128, offset: 0 })
        this.DeleteProp("__New")
    }
}
