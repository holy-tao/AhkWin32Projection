#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct TELEPHONY_CALLTYPE {
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
    static TELEPHONY_CALLTYPE_CIRCUITSWITCHED => 0

    /**
     * @type {Integer (Int32)}
     */
    static TELEPHONY_CALLTYPE_PACKETSWITCHED_LTE => 1

    /**
     * @type {Integer (Int32)}
     */
    static TELEPHONY_CALLTYPE_PACKETSWITCHED_WLAN => 2
}
