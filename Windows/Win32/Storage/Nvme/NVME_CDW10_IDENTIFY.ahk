#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains parameters for the Identify command that returns a data buffer that describes information about the NVM subsystem, the controller or the namespace(s).
 * @remarks
 * The Identify command returns information about the controller in the [NVME_IDENTIFY_CONTROLLER_DATA](ns-nvme-nvme_identify_controller_data.md) data structure, and namespace information in the [NVME_IDENTIFY_NAMESPACE_DATA](../nvme/ns-nvme-nvme_identify_namespace_data.md) data structure.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw10_identify
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW10_IDENTIFY {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - CNS
     * - Reserved
     * - CNTID
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    CNS {
        get => (this._bitfield >> 0) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 0) | (this._bitfield & ~(0xFF << 0))
    }

    /**
     * @type {Integer}
     */
    CNTID {
        get => (this._bitfield >> 16) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 16) | (this._bitfield & ~(0xFFFF << 16))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
