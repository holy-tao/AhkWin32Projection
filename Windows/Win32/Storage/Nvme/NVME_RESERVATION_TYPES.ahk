#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_RESERVATION_TYPES {
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
    static NVME_RESERVATION_TYPE_RESERVED => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_RESERVATION_TYPE_WRITE_EXCLUSIVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_RESERVATION_TYPE_EXCLUSIVE_ACCESS => 2

    /**
     * @type {Integer (Int32)}
     */
    static NVME_RESERVATION_TYPE_WRITE_EXCLUSIVE_REGISTRANTS_ONLY => 3

    /**
     * @type {Integer (Int32)}
     */
    static NVME_RESERVATION_TYPE_EXCLUSIVE_ACCESS_REGISTRANTS_ONLY => 4

    /**
     * @type {Integer (Int32)}
     */
    static NVME_RESERVATION_TYPE_WRITE_EXCLUSIVE_ALL_REGISTRANTS => 5

    /**
     * @type {Integer (Int32)}
     */
    static NVME_RESERVATION_TYPE_EXCLUSIVE_ACCESS_ALL_REGISTRANTS => 6
}
