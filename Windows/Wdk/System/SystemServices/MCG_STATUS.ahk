#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct MCG_STATUS {
    #StructPack 1

    /**
     * This bitfield backs the following members:
     * - RestartIpValid
     * - ErrorIpValid
     * - MachineCheckInProgress
     * - LocalMceValid
     * - Reserved1
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    RestartIpValid {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    ErrorIpValid {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    MachineCheckInProgress {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    LocalMceValid {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield >> 4) & 0xFFFFFFF
        set => this._bitfield := ((value & 0xFFFFFFF) << 4) | (this._bitfield & ~(0xFFFFFFF << 4))
    }
    Reserved2 : UInt32

    static __New() {
        DefineProp(this.Prototype, 'QuadPart', { type: Int64, offset: 0 })
        this.DeleteProp("__New")
    }
}
