#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct ZONE_STATE {
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
    static NVME_STATE_ZSE => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATE_ZSIO => 2

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATE_ZSEO => 3

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATE_ZSC => 4

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATE_ZSRO => 13

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATE_ZSF => 14

    /**
     * @type {Integer (Int32)}
     */
    static NVME_STATE_ZSO => 15
}
