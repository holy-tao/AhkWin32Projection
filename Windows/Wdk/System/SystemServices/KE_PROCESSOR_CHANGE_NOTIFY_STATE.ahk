#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct KE_PROCESSOR_CHANGE_NOTIFY_STATE {
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
    static KeProcessorAddStartNotify => 0

    /**
     * @type {Integer (Int32)}
     */
    static KeProcessorAddCompleteNotify => 1

    /**
     * @type {Integer (Int32)}
     */
    static KeProcessorAddFailureNotify => 2
}
