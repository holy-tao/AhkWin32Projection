#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains parameters for the NVME Read and NVME Write commands that read or write data and metadata, if applicable, to and from the NVM controller for the specified Logical Block Addresses (LBA).
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw12_read_write
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW12_READ_WRITE {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - NLB
     * - Reserved0
     * - DTYPE
     * - Reserved1
     * - PRINFO
     * - FUA
     * - LR
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    NLB {
        get => (this._bitfield >> 0) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 0) | (this._bitfield & ~(0xFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 16) & 0xF
        set => this._bitfield := ((value & 0xF) << 16) | (this._bitfield & ~(0xF << 16))
    }

    /**
     * @type {Integer}
     */
    DTYPE {
        get => (this._bitfield >> 20) & 0xF
        set => this._bitfield := ((value & 0xF) << 20) | (this._bitfield & ~(0xF << 20))
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield >> 24) & 0x3
        set => this._bitfield := ((value & 0x3) << 24) | (this._bitfield & ~(0x3 << 24))
    }

    /**
     * @type {Integer}
     */
    PRINFO {
        get => (this._bitfield >> 26) & 0xF
        set => this._bitfield := ((value & 0xF) << 26) | (this._bitfield & ~(0xF << 26))
    }

    /**
     * @type {Integer}
     */
    FUA {
        get => (this._bitfield >> 30) & 0x1
        set => this._bitfield := ((value & 0x1) << 30) | (this._bitfield & ~(0x1 << 30))
    }

    /**
     * @type {Integer}
     */
    LR {
        get => (this._bitfield >> 31) & 0x1
        set => this._bitfield := ((value & 0x1) << 31) | (this._bitfield & ~(0x1 << 31))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
