#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_cc_shn_shutdown_notifications
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_CC_SHN_SHUTDOWN_NOTIFICATIONS{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_CC_SHN_NO_NOTIFICATION => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_CC_SHN_NORMAL_SHUTDOWN => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_CC_SHN_ABRUPT_SHUTDOWN => 2
}
