#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Services
 */
export default struct SERVICE_START_TYPE {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_AUTO_START => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_BOOT_START => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_DEMAND_START => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_DISABLED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_SYSTEM_START => 1
}
