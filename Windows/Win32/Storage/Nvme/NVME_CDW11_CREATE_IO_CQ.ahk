#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains parameters for the Create I/O Completion Queue command, that is used to create all I/O Completion Queues with the exception of the Admin Completion Queue.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw11_create_io_cq
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW11_CREATE_IO_CQ {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - PC
     * - IEN
     * - Reserved0
     * - IV
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
    IEN {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 2) & 0x3FFF
        set => this._bitfield := ((value & 0x3FFF) << 2) | (this._bitfield & ~(0x3FFF << 2))
    }

    /**
     * @type {Integer}
     */
    IV {
        get => (this._bitfield >> 16) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 16) | (this._bitfield & ~(0xFFFF << 16))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
