#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity.Provider
 */
export default struct ACCOUNT_STATE {
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
    static NOT_CONNECTED => 0

    /**
     * @type {Integer (Int32)}
     */
    static CONNECTING => 1

    /**
     * @type {Integer (Int32)}
     */
    static CONNECT_COMPLETED => 2
}
