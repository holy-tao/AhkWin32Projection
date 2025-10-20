#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_async_event_health_status_codes
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_ASYNC_EVENT_HEALTH_STATUS_CODES{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ASYNC_HEALTH_NVM_SUBSYSTEM_RELIABILITY => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ASYNC_HEALTH_TEMPERATURE_THRESHOLD => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ASYNC_HEALTH_SPARE_BELOW_THRESHOLD => 2
}
