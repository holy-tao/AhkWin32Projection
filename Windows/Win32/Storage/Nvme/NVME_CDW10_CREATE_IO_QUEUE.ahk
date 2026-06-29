#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains parameters that are used in the Create I/O Completion Queue and Create IO Submission Queue commands.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw10_create_io_queue
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW10_CREATE_IO_QUEUE {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - QID
     * - QSIZE
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    QID {
        get => (this._bitfield >> 0) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 0) | (this._bitfield & ~(0xFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    QSIZE {
        get => (this._bitfield >> 16) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 16) | (this._bitfield & ~(0xFFFF << 16))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
