#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains values that indicate a SMART/Health Status event type.
 * @remarks
 * Use this enumeration to specify values in the **NVME_ASYNC_EVENT_TYPE_HEALTH_STATUS** field of the [NVME_ASYNC_EVENT_TYPES](ne-nvme-nvme_async_event_types.md) enumeration that is used in the Async Event Request Admin command.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_async_event_health_status_codes
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_ASYNC_EVENT_HEALTH_STATUS_CODES {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * NVM subsystem reliability has been compromised. This may be due to significant media errors, an internal error, the media being placed in read only mode, or a volatile memory backup device failing.
     * @type {Integer (Int32)}
     */
    static NVME_ASYNC_HEALTH_NVM_SUBSYSTEM_RELIABILITY => 0

    /**
     * A temperature is above an over-temperature threshold or below an under-temperature threshold.
     * @type {Integer (Int32)}
     */
    static NVME_ASYNC_HEALTH_TEMPERATURE_THRESHOLD => 1

    /**
     * The available spare space has fallen below the threshold.
     * @type {Integer (Int32)}
     */
    static NVME_ASYNC_HEALTH_SPARE_BELOW_THRESHOLD => 2
}
