#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains parameters for the Number of Queues Feature that indicate the number of I/O Completion Queues and I/O Submission Queues that the host requests for this controller.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw11_feature_number_of_queues
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW11_FEATURE_NUMBER_OF_QUEUES {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - NSQ
     * - NCQ
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    NSQ {
        get => (this._bitfield >> 0) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 0) | (this._bitfield & ~(0xFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    NCQ {
        get => (this._bitfield >> 16) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 16) | (this._bitfield & ~(0xFFFF << 16))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
