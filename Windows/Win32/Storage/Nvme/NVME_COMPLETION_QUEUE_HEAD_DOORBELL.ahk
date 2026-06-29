#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the doorbell register that updates the Head entry pointer for Completion Queue *y*.
 * @remarks
 * The host should not read the doorbell registers. If a doorbell register is read, the value returned is vendor specific. Writing to a non-existent Completion Queue Head Doorbell has undefined results.
 * 
 * Host software should continue to process completion queue entries within Completion Queues regardless of whether there are entries available in any Submission Queue.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_completion_queue_head_doorbell
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_COMPLETION_QUEUE_HEAD_DOORBELL {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - CQH
     * - Reserved0
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    CQH {
        get => (this._bitfield >> 0) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 0) | (this._bitfield & ~(0xFFFF << 0))
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 16) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 16) | (this._bitfield & ~(0xFFFF << 16))
    }
    static __New() {
        DefineProp(this.Prototype, 'AsUlong', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
