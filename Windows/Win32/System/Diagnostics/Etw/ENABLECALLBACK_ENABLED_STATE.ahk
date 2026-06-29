#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct ENABLECALLBACK_ENABLED_STATE {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_CONTROL_CODE_DISABLE_PROVIDER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_CONTROL_CODE_ENABLE_PROVIDER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EVENT_CONTROL_CODE_CAPTURE_STATE => 2
}
