#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_FIRMWARE_ACTIVATE_ACTIONS{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FIRMWARE_ACTIVATE_ACTION_DOWNLOAD_TO_SLOT => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FIRMWARE_ACTIVATE_ACTION_DOWNLOAD_TO_SLOT_AND_ACTIVATE => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FIRMWARE_ACTIVATE_ACTION_ACTIVATE => 2

    /**
     * @type {Integer (Int32)}
     */
    static NVME_FIRMWARE_ACTIVATE_ACTION_DOWNLOAD_TO_SLOT_AND_ACTIVATE_IMMEDIATE => 3
}
