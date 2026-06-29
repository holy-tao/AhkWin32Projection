#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_ZONE_SEND_ACTION {
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
    static NVME_ZONE_SEND_CLOSE => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ZONE_SEND_FINISH => 2

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ZONE_SEND_OPEN => 3

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ZONE_SEND_RESET => 4

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ZONE_SEND_OFFLINE => 5

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ZONE_SEND_SET_ZONE_DESCRIPTOR => 16
}
