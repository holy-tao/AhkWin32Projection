#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_ZONE_RECEIVE_ACTION_SPECIFIC {
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
    static NVME_ZRA_ALL_ZONES => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ZRA_EMPTY_STATE_ZONES => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ZRA_IO_STATE_ZONES => 2

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ZRA_EO_STATE_ZONES => 3

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ZRA_CLOSED_STATE_ZONES => 4

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ZRA_FULL_STATE_ZONES => 5

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ZRA_RO_STATE_ZONES => 6

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ZRA_OFFLINE_STATE_ZONES => 7
}
