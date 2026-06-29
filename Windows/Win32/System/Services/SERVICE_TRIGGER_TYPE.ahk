#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Services
 */
export default struct SERVICE_TRIGGER_TYPE {
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
    static SERVICE_TRIGGER_TYPE_CUSTOM => 20

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_TRIGGER_TYPE_DEVICE_INTERFACE_ARRIVAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_TRIGGER_TYPE_DOMAIN_JOIN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_TRIGGER_TYPE_FIREWALL_PORT_EVENT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_TRIGGER_TYPE_GROUP_POLICY => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_TRIGGER_TYPE_IP_ADDRESS_AVAILABILITY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_TRIGGER_TYPE_NETWORK_ENDPOINT => 6
}
