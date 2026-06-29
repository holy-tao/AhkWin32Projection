#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains parameters for the Create IO Submission Queue command, that is used to create IO Submission Queues.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw11_create_io_sq
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW11_CREATE_IO_SQ {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - PC
     * - QPRIO
     * - Reserved0
     * - CQID
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    PC {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    QPRIO {
        get => (this._bitfield >> 1) & 0x3
        set => this._bitfield := ((value & 0x3) << 1) | (this._bitfield & ~(0x3 << 1))
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 3) & 0x1FFF
        set => this._bitfield := ((value & 0x1FFF) << 3) | (this._bitfield & ~(0x1FFF << 3))
    }

    /**
     * @type {Integer}
     */
    CQID {
        get => (this._bitfield >> 16) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 16) | (this._bitfield & ~(0xFFFF << 16))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
