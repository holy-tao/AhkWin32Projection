#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_TRIGGER_TYPE{

    /**
     * @type {Integer (Int32)}
     */
    static WHvTriggerTypeInterrupt => 0

    /**
     * @type {Integer (Int32)}
     */
    static WHvTriggerTypeSynicEvent => 1

    /**
     * @type {Integer (Int32)}
     */
    static WHvTriggerTypeDeviceInterrupt => 2
}
