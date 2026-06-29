#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Services
 */
export default struct SERVICE_CONFIG {
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
    static SERVICE_CONFIG_DELAYED_AUTO_START_INFO => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_CONFIG_DESCRIPTION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_CONFIG_FAILURE_ACTIONS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_CONFIG_FAILURE_ACTIONS_FLAG => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_CONFIG_PREFERRED_NODE => 9

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_CONFIG_PRESHUTDOWN_INFO => 7

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_CONFIG_REQUIRED_PRIVILEGES_INFO => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_CONFIG_SERVICE_SID_INFO => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_CONFIG_TRIGGER_INFO => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_CONFIG_LAUNCH_PROTECTED => 12
}
