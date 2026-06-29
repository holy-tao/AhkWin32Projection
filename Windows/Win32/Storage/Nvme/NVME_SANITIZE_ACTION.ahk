#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_SANITIZE_ACTION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
