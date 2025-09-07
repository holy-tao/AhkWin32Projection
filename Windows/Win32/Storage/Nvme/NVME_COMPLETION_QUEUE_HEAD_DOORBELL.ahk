#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the doorbell register that updates the Head entry pointer for Completion Queue *y*.
 * @remarks
 * The host should not read the doorbell registers. If a doorbell register is read, the value returned is vendor specific. Writing to a non-existent Completion Queue Head Doorbell has undefined results.
  * 
  * Host software should continue to process completion queue entries within Completion Queues regardless of whether there are entries available in any Submission Queue.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_completion_queue_head_doorbell
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_COMPLETION_QUEUE_HEAD_DOORBELL extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Anonymous {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    AsUlong {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
