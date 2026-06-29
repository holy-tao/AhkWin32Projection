#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_WCS_DEVICE_RESET_ACTION {
    #StructPack 1

    /**
     * This bitfield backs the following members:
     * - ControllerReset
     * - NVMeSubsystemReset
     * - PCIeFLR
     * - PERST
     * - PowerCycle
     * - PCIeConventionalHotReset
     * - Reserved
     */
    _bitfield : Int8


    /**
     * @type {Integer}
     */
    ControllerReset {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    NVMeSubsystemReset {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {Integer}
     */
    PCIeFLR {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * @type {Integer}
     */
    PERST {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * @type {Integer}
     */
    PowerCycle {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * @type {Integer}
     */
    PCIeConventionalHotReset {
        get => (this._bitfield >> 5) & 0x1
        set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUCHAR', { type: Int8, offset: 0 })
        this.DeleteProp("__New")
    }
}
