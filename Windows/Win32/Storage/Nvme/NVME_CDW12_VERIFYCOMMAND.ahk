#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW12_VERIFYCOMMAND {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - NLB
     * - Reserved
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
