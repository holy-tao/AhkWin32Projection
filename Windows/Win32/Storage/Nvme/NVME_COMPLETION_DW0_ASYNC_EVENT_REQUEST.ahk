#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about an asynchronous event that is posted to the Admin Completion Queue in DWord 0 of a Completion Queue Entry. Asynchronous events are used to notify the host software of status, error, and health information.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_completion_dw0_async_event_request
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_COMPLETION_DW0_ASYNC_EVENT_REQUEST extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - AsyncEventType
     * - Reserved0
     * - AsyncEventInfo
     * - LogPage
     * - Reserved1
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An [NVME_ASYNC_EVENT_TYPES](ne-nvme-nvme_async_event_types.md) value that indicates the type of the asynchronous event. 
     * 
     * More specific information about the event is provided in the Asynchronous Event Information (**AsyncEventInfo**) field.
     * @type {Integer}
     */
    AsyncEventType {
        get => (this._bitfield >> 0) & 0x7
        set => this._bitfield := ((value & 0x7) << 0) | (this._bitfield & ~(0x7 << 0))
    }

    /**
     * 
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 3) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 3) | (this._bitfield & ~(0x1F << 3))
    }

    /**
     * Contains detailed information regarding the asynchronous event.
     * @type {Integer}
     */
    AsyncEventInfo {
        get => (this._bitfield >> 8) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 8) | (this._bitfield & ~(0xFF << 8))
    }

    /**
     * Indicates the log page associated with the asynchronous event. This log page must be read by the host to clear the event.
     * @type {Integer}
     */
    LogPage {
        get => (this._bitfield >> 16) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 16) | (this._bitfield & ~(0xFF << 16))
    }

    /**
     * 
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield >> 24) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 24) | (this._bitfield & ~(0xFF << 24))
    }
}
