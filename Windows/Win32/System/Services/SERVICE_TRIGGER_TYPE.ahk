#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Services
 * @version v4.0.30319
 */
class SERVICE_TRIGGER_TYPE extends Win32Enum{

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
