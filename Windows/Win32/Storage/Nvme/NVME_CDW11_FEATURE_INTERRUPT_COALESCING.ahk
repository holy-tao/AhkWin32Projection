#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains parameters for the Interrupt Coalescing Feature that configures the interrupt coalescing settings.
 * @remarks
 * The controller signals an interrupt when either the Aggregation Time (**TIME**) or the Aggregation Threshold (**THR**) conditions are met. If either the **TIME** or the **THR** fields are cleared to `0h`, then interrupt coalescing is implicitly disabled.
 * 
 * The Interrupt Coalescing Feature is valid when the controller is configured for Pin Based, MSI, Multiple MSI or MSI-X interrupts. There is no requirement for the controller to persist these settings if interrupt modes are changed. It is recommended that the host re-issue this feature after changing interrupt modes.
 * 
 * The controller may delay an interrupt if it detects that interrupts are already being processed for this vector. Specifically, if the [Completion Queue Head Doorbell](ns-nvme-nvme_completion_queue_head_doorbell.md) register is being updated that is associated with a particular interrupt vector, then the controller has a positive indication that completion queue entries are already being processed. In this case, the aggregation time and/or the aggregation threshold may be reset/restarted upon the associated register write. This may result in interrupts being delayed indefinitely in certain workloads where the aggregation time or aggregation threshold are non-zero.
 * 
 * The Interrupt Coalescing Feature applies only to the I/O Submission and I/O Completion Queues. interrupts for commands that complete in error should not be coalesced.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw11_feature_interrupt_coalescing
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_CDW11_FEATURE_INTERRUPT_COALESCING extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - THR
     * - TIME
     * - Reserved0
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    THR {
        get => (this._bitfield >> 0) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 0) | (this._bitfield & ~(0xFF << 0))
    }

    /**
     * @type {Integer}
     */
    TIME {
        get => (this._bitfield >> 8) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 8) | (this._bitfield & ~(0xFF << 8))
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 16) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 16) | (this._bitfield & ~(0xFFFF << 16))
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
