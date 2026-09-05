#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_SANITIZE_ACTION extends Win32Enum {

    /**
     * Native name: NVME_SANITIZE_ACTION_RESERVED
     * @type {Integer (Int32)}
     */
    static RESERVED => 0

    /**
     * Native name: NVME_SANITIZE_ACTION_EXIT_FAILURE_MODE
     * @type {Integer (Int32)}
     */
    static EXIT_FAILURE_MODE => 1

    /**
     * Native name: NVME_SANITIZE_ACTION_START_BLOCK_ERASE_SANITIZE
     * @type {Integer (Int32)}
     */
    static START_BLOCK_ERASE_SANITIZE => 2

    /**
     * Native name: NVME_SANITIZE_ACTION_START_OVERWRITE_SANITIZE
     * @type {Integer (Int32)}
     */
    static START_OVERWRITE_SANITIZE => 3

    /**
     * Native name: NVME_SANITIZE_ACTION_START_CRYPTO_ERASE_SANITIZE
     * @type {Integer (Int32)}
     */
    static START_CRYPTO_ERASE_SANITIZE => 4
}
