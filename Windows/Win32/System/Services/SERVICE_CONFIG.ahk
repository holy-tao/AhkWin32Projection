#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Services
 */
class SERVICE_CONFIG extends Win32Enum {

    /**
     * Native name: SERVICE_CONFIG_DELAYED_AUTO_START_INFO
     * @type {Integer (UInt32)}
     */
    static DELAYED_AUTO_START_INFO => 3

    /**
     * Native name: SERVICE_CONFIG_DESCRIPTION
     * @type {Integer (UInt32)}
     */
    static DESCRIPTION => 1

    /**
     * Native name: SERVICE_CONFIG_FAILURE_ACTIONS
     * @type {Integer (UInt32)}
     */
    static FAILURE_ACTIONS => 2

    /**
     * Native name: SERVICE_CONFIG_FAILURE_ACTIONS_FLAG
     * @type {Integer (UInt32)}
     */
    static FAILURE_ACTIONS_FLAG => 4

    /**
     * Native name: SERVICE_CONFIG_PREFERRED_NODE
     * @type {Integer (UInt32)}
     */
    static PREFERRED_NODE => 9

    /**
     * Native name: SERVICE_CONFIG_PRESHUTDOWN_INFO
     * @type {Integer (UInt32)}
     */
    static PRESHUTDOWN_INFO => 7

    /**
     * Native name: SERVICE_CONFIG_REQUIRED_PRIVILEGES_INFO
     * @type {Integer (UInt32)}
     */
    static REQUIRED_PRIVILEGES_INFO => 6

    /**
     * Native name: SERVICE_CONFIG_SERVICE_SID_INFO
     * @type {Integer (UInt32)}
     */
    static SERVICE_SID_INFO => 5

    /**
     * Native name: SERVICE_CONFIG_TRIGGER_INFO
     * @type {Integer (UInt32)}
     */
    static TRIGGER_INFO => 8

    /**
     * Native name: SERVICE_CONFIG_LAUNCH_PROTECTED
     * @type {Integer (UInt32)}
     */
    static LAUNCH_PROTECTED => 12
}
