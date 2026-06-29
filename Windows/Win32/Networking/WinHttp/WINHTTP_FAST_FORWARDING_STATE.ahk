#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinHttp
 */
export default struct WINHTTP_FAST_FORWARDING_STATE {
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
    static WinHttpFastForwardingStateInProgress => 0

    /**
     * @type {Integer (Int32)}
     */
    static WinHttpFastForwardingStateSucceeded => 1

    /**
     * @type {Integer (Int32)}
     */
    static WinHttpFastForwardingStateClientSideFailed => 2

    /**
     * @type {Integer (Int32)}
     */
    static WinHttpFastForwardingStateServerSideFailed => 3
}
