#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_PROCESSOR_COUNTER_SET {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
