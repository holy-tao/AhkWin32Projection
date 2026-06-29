#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_VIRTUAL_PROCESSOR_STATE_TYPE {
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
