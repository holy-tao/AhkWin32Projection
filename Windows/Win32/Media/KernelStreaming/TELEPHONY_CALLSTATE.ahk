#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct TELEPHONY_CALLSTATE {
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
    static TELEPHONY_CALLSTATE_DISABLED => 0

    /**
     * @type {Integer (Int32)}
     */
    static TELEPHONY_CALLSTATE_ENABLED => 1

    /**
     * @type {Integer (Int32)}
     */
    static TELEPHONY_CALLSTATE_HOLD => 2

    /**
     * @type {Integer (Int32)}
     */
    static TELEPHONY_CALLSTATE_PROVIDERTRANSITION => 3
}
