#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct CM_LOG_CONF {
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
    static BASIC_LOG_CONF => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FILTERED_LOG_CONF => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ALLOC_LOG_CONF => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BOOT_LOG_CONF => 3

    /**
     * @type {Integer (UInt32)}
     */
    static FORCED_LOG_CONF => 4

    /**
     * @type {Integer (UInt32)}
     */
    static OVERRIDE_LOG_CONF => 5

    /**
     * @type {Integer (UInt32)}
     */
    static NUM_LOG_CONF => 6
}
