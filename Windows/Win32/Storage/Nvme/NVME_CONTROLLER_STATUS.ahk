#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains values that indicate controller status.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_controller_status
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CONTROLLER_STATUS {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - RDY
     * - CFS
     * - SHST
     * - NSSRO
     * - PP
     * - ST
     * - Reserved0
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    RDY {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    CFS {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    SHST {
        get => (this._bitfield >> 2) & 0x3
        set => this._bitfield := ((value & 0x3) << 2) | (this._bitfield & ~(0x3 << 2))
    }

    /**
     * @type {Integer}
     */
    NSSRO {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    PP {
        get => (this._bitfield >> 5) & 0x1
        set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
    }

    /**
     * @type {Integer}
     */
    ST {
        get => (this._bitfield >> 6) & 0x1
        set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 7) & 0x1FFFFFF
        set => this._bitfield := ((value & 0x1FFFFFF) << 7) | (this._bitfield & ~(0x1FFFFFF << 7))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
