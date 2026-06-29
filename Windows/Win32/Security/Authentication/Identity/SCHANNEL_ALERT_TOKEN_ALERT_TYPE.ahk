#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SCHANNEL_ALERT_TOKEN_ALERT_TYPE {
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
    static TLS1_ALERT_WARNING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TLS1_ALERT_FATAL => 2
}
