#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the size of the optional Controller Memory Buffer register, and is used in the **CMBSZ** field of the [NVME_CONTROLLER_REGISTERS](../nvme/ns-nvme-nvme_controller_registers.md) structure.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_controller_memory_buffer_size
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CONTROLLER_MEMORY_BUFFER_SIZE {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - SQS
     * - CQS
     * - LISTS
     * - RDS
     * - WDS
     * - Reserved
     * - SZU
     * - SZ
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    SQS {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    CQS {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    LISTS {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    RDS {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    WDS {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    SZU {
        get => (this._bitfield >> 8) & 0xF
        set => this._bitfield := ((value & 0xF) << 8) | (this._bitfield & ~(0xF << 8))
    }

    /**
     * @type {Integer}
     */
    SZ {
        get => (this._bitfield >> 12) & 0xFFFFF
        set => this._bitfield := ((value & 0xFFFFF) << 12) | (this._bitfield & ~(0xFFFFF << 12))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
