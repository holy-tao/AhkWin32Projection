#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_PROTOCOL_DATA_SUBVALUE_GET_LOG_PAGE {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - RetainAsynEvent
     * - LogSpecificField
     * - Reserved0
     * - UUIDIndex
     * - Reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    RetainAsynEvent {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    LogSpecificField {
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
    UUIDIndex {
        get => (this._bitfield >> 8) & 0x7F
        set => this._bitfield := ((value & 0x7F) << 8) | (this._bitfield & ~(0x7F << 8))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
