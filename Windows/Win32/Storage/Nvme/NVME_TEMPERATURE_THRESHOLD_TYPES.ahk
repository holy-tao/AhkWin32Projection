#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_temperature_threshold_types
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_TEMPERATURE_THRESHOLD_TYPES{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_TEMPERATURE_OVER_THRESHOLD => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_TEMPERATURE_UNDER_THRESHOLD => 1
}
