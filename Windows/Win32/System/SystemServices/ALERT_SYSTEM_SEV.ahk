#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct ALERT_SYSTEM_SEV {
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
    static ALERT_SYSTEM_INFORMATIONAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ALERT_SYSTEM_WARNING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ALERT_SYSTEM_ERROR => 3

    /**
     * @type {Integer (UInt32)}
     */
    static ALERT_SYSTEM_QUERY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ALERT_SYSTEM_CRITICAL => 5
}
