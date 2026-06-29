#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the base memory address of the Admin Submission Queue.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_admin_submission_queue_base_address
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_ADMIN_SUBMISSION_QUEUE_BASE_ADDRESS {
    #StructPack 8

    /**
     * This bitfield backs the following members:
     * - Reserved0
     * - ASQB
     */
    _bitfield : Int64


    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 0) & 0xFFF
        set => this._bitfield := ((value & 0xFFF) << 0) | (this._bitfield & ~(0xFFF << 0))
    }

    /**
     * @type {Integer}
     */
    ASQB {
        get => (this._bitfield >> 12) & 0xFFFFFFFFFFFFF
        set => this._bitfield := ((value & 0xFFFFFFFFFFFFF) << 12) | (this._bitfield & ~(0xFFFFFFFFFFFFF << 12))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUlonglong', { type: Int64, offset: 0 })
        this.DeleteProp("__New")
    }
}
