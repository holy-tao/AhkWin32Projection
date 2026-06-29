#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_STATUS_PATH_ERROR_CODES {
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
    static NVME_STATUS_INTERNAL_PATH_ERROR => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_ASYMMETRIC_ACCESS_PERSISTENT_LOSS => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_ASYMMETRIC_ACCESS_INACCESSIBLE => 2

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_ASYMMETRIC_ACCESS_TRANSITION => 3

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_CONTROLLER_PATHING_ERROR => 96

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_HOST_PATHING_ERROR => 112

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATUS_COMMAND_ABORTED_BY_HOST => 113
}
