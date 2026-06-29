#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security
 */
export default struct LOGON32_LOGON {
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
    static LOGON32_LOGON_BATCH => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON32_LOGON_INTERACTIVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON32_LOGON_NETWORK => 3

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON32_LOGON_NETWORK_CLEARTEXT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON32_LOGON_NEW_CREDENTIALS => 9

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON32_LOGON_SERVICE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON32_LOGON_UNLOCK => 7
}
