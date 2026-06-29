#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_AMS_OPTION {
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
    static NVME_AMS_ROUND_ROBIN => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_AMS_WEIGHTED_ROUND_ROBIN_URGENT => 1
}
