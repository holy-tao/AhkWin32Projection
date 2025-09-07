#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_VIRTUAL_PROCESSOR_STATE_TYPE{

    /**
     * @type {Integer (Int32)}
     */
    static WHvVirtualProcessorStateTypeSynicMessagePage => 0

    /**
     * @type {Integer (Int32)}
     */
    static WHvVirtualProcessorStateTypeSynicEventFlagPage => 1

    /**
     * @type {Integer (Int32)}
     */
    static WHvVirtualProcessorStateTypeSynicTimerState => 2

    /**
     * @type {Integer (Int32)}
     */
    static WHvVirtualProcessorStateTypeInterruptControllerState2 => 4096

    /**
     * @type {Integer (Int32)}
     */
    static WHvVirtualProcessorStateTypeXsaveState => 4097
}
