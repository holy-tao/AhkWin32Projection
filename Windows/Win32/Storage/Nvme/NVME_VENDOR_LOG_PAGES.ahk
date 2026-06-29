#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_VENDOR_LOG_PAGES {
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
    static NVME_LOG_PAGE_OCP_DEVICE_SMART_INFORMATION => 192

    /**
     * @type {Integer (Int32)}
     */
    static NVME_LOG_PAGE_OCP_DEVICE_ERROR_RECOVERY => 193

    /**
     * @type {Integer (Int32)}
     */
    static NVME_LOG_PAGE_OCP_FIRMWARE_ACTIVATION_HISTORY => 194

    /**
     * @type {Integer (Int32)}
     */
    static NVME_LOG_PAGE_OCP_LATENCY_MONITOR => 195

    /**
     * @type {Integer (Int32)}
     */
    static NVME_LOG_PAGE_OCP_DEVICE_CAPABILITIES => 196

    /**
     * @type {Integer (Int32)}
     */
    static NVME_LOG_PAGE_OCP_UNSUPPORTED_REQUIREMENTS => 197

    /**
     * @type {Integer (Int32)}
     */
    static NVME_LOG_PAGE_OCP_TCG_CONFIGURATION => 200

    /**
     * @type {Integer (Int32)}
     */
    static NVME_LOG_PAGE_OCP_TCG_HISTORY => 201
}
