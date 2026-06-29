#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct DelayRetryAction {
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
    static DelayRetryUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static DelayRetryNone => 1

    /**
     * @type {Integer (Int32)}
     */
    static DelayRetryShort => 2

    /**
     * @type {Integer (Int32)}
     */
    static DelayRetryLong => 3

    /**
     * @type {Integer (Int32)}
     */
    static DelayRetrySuccess => 4

    /**
     * @type {Integer (Int32)}
     */
    static DelayRetryPastSuccess => 5
}
