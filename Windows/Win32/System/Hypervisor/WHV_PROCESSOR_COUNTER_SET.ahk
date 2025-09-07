#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_PROCESSOR_COUNTER_SET{

    /**
     * @type {Integer (Int32)}
     */
    static WHvProcessorCounterSetRuntime => 0

    /**
     * @type {Integer (Int32)}
     */
    static WHvProcessorCounterSetIntercepts => 1

    /**
     * @type {Integer (Int32)}
     */
    static WHvProcessorCounterSetEvents => 2

    /**
     * @type {Integer (Int32)}
     */
    static WHvProcessorCounterSetApic => 3

    /**
     * @type {Integer (Int32)}
     */
    static WHvProcessorCounterSetSyntheticFeatures => 4
}
