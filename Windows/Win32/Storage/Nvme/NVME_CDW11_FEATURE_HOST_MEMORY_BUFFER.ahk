#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains parameters for the Host Memory Buffer Feature that provides a mechanism for the host to allocate a portion of host memory for the controller to use exclusively.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw11_feature_host_memory_buffer
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW11_FEATURE_HOST_MEMORY_BUFFER {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - EHM
     * - MR
     * - Reserved
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    EHM {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    MR {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
