#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_VENDOR_LOG_PAGES extends Win32Enum {

    /**
     * Native name: NVME_LOG_PAGE_OCP_DEVICE_SMART_INFORMATION
     * @type {Integer (Int32)}
     */
    static PAGE_OCP_DEVICE_SMART_INFORMATION => 192

    /**
     * Native name: NVME_LOG_PAGE_OCP_DEVICE_ERROR_RECOVERY
     * @type {Integer (Int32)}
     */
    static PAGE_OCP_DEVICE_ERROR_RECOVERY => 193

    /**
     * Native name: NVME_LOG_PAGE_OCP_FIRMWARE_ACTIVATION_HISTORY
     * @type {Integer (Int32)}
     */
    static PAGE_OCP_FIRMWARE_ACTIVATION_HISTORY => 194

    /**
     * Native name: NVME_LOG_PAGE_OCP_LATENCY_MONITOR
     * @type {Integer (Int32)}
     */
    static PAGE_OCP_LATENCY_MONITOR => 195

    /**
     * Native name: NVME_LOG_PAGE_OCP_DEVICE_CAPABILITIES
     * @type {Integer (Int32)}
     */
    static PAGE_OCP_DEVICE_CAPABILITIES => 196

    /**
     * Native name: NVME_LOG_PAGE_OCP_UNSUPPORTED_REQUIREMENTS
     * @type {Integer (Int32)}
     */
    static PAGE_OCP_UNSUPPORTED_REQUIREMENTS => 197

    /**
     * Native name: NVME_LOG_PAGE_OCP_TCG_CONFIGURATION
     * @type {Integer (Int32)}
     */
    static PAGE_OCP_TCG_CONFIGURATION => 200

    /**
     * Native name: NVME_LOG_PAGE_OCP_TCG_HISTORY
     * @type {Integer (Int32)}
     */
    static PAGE_OCP_TCG_HISTORY => 201
}
