#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains parameters for the Interrupt Vector Configuration Feature that configures settings specific to a particular interrupt vector.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw11_feature_interrupt_vector_config
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW11_FEATURE_INTERRUPT_VECTOR_CONFIG {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - IV
     * - CD
     * - Reserved0
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    IV {
        get => (this._bitfield >> 0) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 0) | (this._bitfield & ~(0xFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    CD {
        get => (this._bitfield >> 16) & 0x1
        set => this._bitfield := ((value & 0x1) << 16) | (this._bitfield & ~(0x1 << 16))
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 17) & 0x7FFF
        set => this._bitfield := ((value & 0x7FFF) << 17) | (this._bitfield & ~(0x7FFF << 17))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
