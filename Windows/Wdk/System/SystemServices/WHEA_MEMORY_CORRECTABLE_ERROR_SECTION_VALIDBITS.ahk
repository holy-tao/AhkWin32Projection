#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_MEMORY_CORRECTABLE_ERROR_SECTION_VALIDBITS {
    #StructPack 1

    /**
     * This bitfield backs the following members:
     * - SocketId
     * - ChannelId
     * - DimmSlot
     * - CorrectableErrorCount
     * - Reserved
     */
    _bitfield : Int64


    /**
     * @type {Integer}
     */
    SocketId {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    ChannelId {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    DimmSlot {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    CorrectableErrorCount {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }
    static __New() {
        DefineProp(this.Prototype, 'ValidBits', { type: Int64, offset: 0 })
        this.DeleteProp("__New")
    }
}
