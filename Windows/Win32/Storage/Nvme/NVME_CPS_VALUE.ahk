#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CPS_VALUE {
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
    static NVME_CPS_NOT_REPORTED => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_CPS_CONTROLLER_SCOPE => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_CPS_DOMAIN_SCOPE => 2

    /**
     * @type {Integer (Int32)}
     */
    static NVME_CPS_SUBSYSTEM_SCOPE => 3
}
