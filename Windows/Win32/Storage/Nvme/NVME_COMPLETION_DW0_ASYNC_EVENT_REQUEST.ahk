#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about an asynchronous event that is posted to the Admin Completion Queue in DWord 0 of a Completion Queue Entry. Asynchronous events are used to notify the host software of status, error, and health information.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_completion_dw0_async_event_request
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_COMPLETION_DW0_ASYNC_EVENT_REQUEST {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - AsyncEventType
     * - Reserved0
     * - AsyncEventInfo
     * - LogPage
     * - Reserved1
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    AsyncEventType {
        get => (this._bitfield >> 0) & 0x7
        set => this._bitfield := ((value & 0x7) << 0) | (this._bitfield & ~(0x7 << 0))
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => (this._bitfield >> 3) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 3) | (this._bitfield & ~(0x1F << 3))
    }

    /**
     * @type {Integer}
     */
    AsyncEventInfo {
        get => (this._bitfield >> 8) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 8) | (this._bitfield & ~(0xFF << 8))
    }

    /**
     * @type {Integer}
     */
    LogPage {
        get => (this._bitfield >> 16) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 16) | (this._bitfield & ~(0xFF << 16))
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => (this._bitfield >> 24) & 0xFF
        set => this._bitfield := ((value & 0xFF) << 24) | (this._bitfield & ~(0xFF << 24))
    }
}
