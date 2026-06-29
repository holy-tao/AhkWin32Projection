#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Threading
 */
export default struct CREATE_EVENT {
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
    static CREATE_EVENT_INITIAL_SET => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CREATE_EVENT_MANUAL_RESET => 1
}
