#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct COMAdminTransactionOptions {
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
    static COMAdminTransactionIgnored => 0

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminTransactionNone => 1

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminTransactionSupported => 2

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminTransactionRequired => 3

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminTransactionRequiresNew => 4
}
