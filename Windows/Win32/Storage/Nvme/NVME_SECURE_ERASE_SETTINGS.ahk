#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_SECURE_ERASE_SETTINGS{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_SECURE_ERASE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_SECURE_ERASE_USER_DATA => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_SECURE_ERASE_CRYPTOGRAPHIC => 2
}
