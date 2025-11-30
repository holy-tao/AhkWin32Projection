#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_SANITIZE_ACTION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_SANITIZE_ACTION_RESERVED => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_SANITIZE_ACTION_EXIT_FAILURE_MODE => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_SANITIZE_ACTION_START_BLOCK_ERASE_SANITIZE => 2

    /**
     * @type {Integer (Int32)}
     */
    static NVME_SANITIZE_ACTION_START_OVERWRITE_SANITIZE => 3

    /**
     * @type {Integer (Int32)}
     */
    static NVME_SANITIZE_ACTION_START_CRYPTO_ERASE_SANITIZE => 4
}
