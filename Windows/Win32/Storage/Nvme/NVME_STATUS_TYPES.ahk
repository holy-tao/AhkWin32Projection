#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_status_types
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_STATUS_TYPES{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_TYPE_GENERIC_COMMAND => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_TYPE_COMMAND_SPECIFIC => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_TYPE_MEDIA_ERROR => 2

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_TYPE_PATH_RELATED => 3

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_TYPE_VENDOR_SPECIFIC => 7
}
