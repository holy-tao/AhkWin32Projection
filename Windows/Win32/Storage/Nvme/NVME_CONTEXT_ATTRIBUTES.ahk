#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies optional context attributes for a logical block range (LBA range).
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_context_attributes
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CONTEXT_ATTRIBUTES {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - AccessFrequency
     * - AccessLatency
     * - Reserved0
     * - SequentialReadRange
     * - SequentialWriteRange
     * - WritePrepare
     * - Reserved1
     * - CommandAccessSize
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    AccessFrequency {
        get => (this._bitfield >> 0) & 0xF
        set => this._bitfield := ((value & 0xF) << 0) | (this._bitfield & ~(0xF << 0))
    }

    /**
     * @type {Integer}
     */
    AccessLatency {
        get => (this._bitfield >> 4) & 0x3
        set => this._bitfield := ((value & 0x3) << 4) | (this._bitfield & ~(0x3 << 4))
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 6) & 0x3
        set => this._bitfield := ((value & 0x3) << 6) | (this._bitfield & ~(0x3 << 6))
    }

    /**
     * @type {Integer}
     */
    SequentialReadRange {
        get => (this._bitfield >> 8) & 0x1
        set => this._bitfield := ((value & 0x1) << 8) | (this._bitfield & ~(0x1 << 8))
    }

    /**
     * @type {Integer}
     */
    SequentialWriteRange {
        get => (this._bitfield >> 9) & 0x1
        set => this._bitfield := ((value & 0x1) << 9) | (this._bitfield & ~(0x1 << 9))
    }

    /**
     * @type {Integer}
     */
    WritePrepare {
        get => (this._bitfield >> 10) & 0x1
        set => this._bitfield := ((value & 0x1) << 10) | (this._bitfield & ~(0x1 << 10))
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield >> 11) & 0x1FFF
        set => this._bitfield := ((value & 0x1FFF) << 11) | (this._bitfield & ~(0x1FFF << 11))
    }

    /**
     * @type {Integer}
     */
    CommandAccessSize {
        get => (this._bitfield >> 24) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 24) | (this._bitfield & ~(0xFF << 24))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
