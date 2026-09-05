#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Services
 */
class SERVICE_TRIGGER_TYPE extends Win32Enum {

    /**
     * Native name: SERVICE_TRIGGER_TYPE_CUSTOM
     * @type {Integer (UInt32)}
     */
    static CUSTOM => 20

    /**
     * Native name: SERVICE_TRIGGER_TYPE_DEVICE_INTERFACE_ARRIVAL
     * @type {Integer (UInt32)}
     */
    static DEVICE_INTERFACE_ARRIVAL => 1

    /**
     * Native name: SERVICE_TRIGGER_TYPE_DOMAIN_JOIN
     * @type {Integer (UInt32)}
     */
    static DOMAIN_JOIN => 3

    /**
     * Native name: SERVICE_TRIGGER_TYPE_FIREWALL_PORT_EVENT
     * @type {Integer (UInt32)}
     */
    static FIREWALL_PORT_EVENT => 4

    /**
     * Native name: SERVICE_TRIGGER_TYPE_GROUP_POLICY
     * @type {Integer (UInt32)}
     */
    static GROUP_POLICY => 5

    /**
     * Native name: SERVICE_TRIGGER_TYPE_IP_ADDRESS_AVAILABILITY
     * @type {Integer (UInt32)}
     */
    static IP_ADDRESS_AVAILABILITY => 2

    /**
     * Native name: SERVICE_TRIGGER_TYPE_NETWORK_ENDPOINT
     * @type {Integer (UInt32)}
     */
    static NETWORK_ENDPOINT => 6
}
