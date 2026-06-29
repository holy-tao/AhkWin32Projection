#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the location of the optional Controller Memory Buffer Location register in the **CMBLOC** field of the [NVME_CONTROLLER_REGISTERS](../nvme/ns-nvme-nvme_controller_registers.md) structure.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_controller_memory_buffer_location
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CONTROLLER_MEMORY_BUFFER_LOCATION {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - BIR
     * - Reserved
     * - OFST
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    BIR {
        get => (this._bitfield >> 0) & 0x7
        set => this._bitfield := ((value & 0x7) << 0) | (this._bitfield & ~(0x7 << 0))
    }

    /**
     * @type {Integer}
     */
    OFST {
        get => (this._bitfield >> 12) & 0xFFFFF
        set => this._bitfield := ((value & 0xFFFFF) << 12) | (this._bitfield & ~(0xFFFFF << 12))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
