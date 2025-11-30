#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Services
 * @version v4.0.30319
 */
class SERVICE_CONFIG extends Win32Enum{

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
