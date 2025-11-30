#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class PLUGIN_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UNKNOWN_PLUGIN => 0

    /**
     * @type {Integer (Int32)}
     */
    static POLICY_PLUGIN => 1

    /**
     * @type {Integer (Int32)}
     */
    static RESOURCE_PLUGIN => 2

    /**
     * @type {Integer (Int32)}
     */
    static LOAD_BALANCING_PLUGIN => 4

    /**
     * @type {Integer (Int32)}
     */
    static PLACEMENT_PLUGIN => 8

    /**
     * @type {Integer (Int32)}
     */
    static ORCHESTRATION_PLUGIN => 16

    /**
     * @type {Integer (Int32)}
     */
    static PROVISIONING_PLUGIN => 32

    /**
     * @type {Integer (Int32)}
     */
    static TASK_PLUGIN => 64
}
