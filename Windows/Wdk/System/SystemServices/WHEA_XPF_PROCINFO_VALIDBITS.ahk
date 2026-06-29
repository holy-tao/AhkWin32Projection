#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_XPF_PROCINFO_VALIDBITS {
    #StructPack 1

    /**
     * This bitfield backs the following members:
     * - CheckInfo
     * - TargetId
     * - RequesterId
     * - ResponderId
     * - InstructionPointer
     * - Reserved
     */
    _bitfield : Int64


    /**
     * @type {Integer}
     */
    CheckInfo {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    TargetId {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    RequesterId {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    ResponderId {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    InstructionPointer {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }
    static __New() {
        DefineProp(this.Prototype, 'ValidBits', { type: Int64, offset: 0 })
        this.DeleteProp("__New")
    }
}
