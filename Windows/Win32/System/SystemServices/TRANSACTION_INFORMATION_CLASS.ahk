#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct TRANSACTION_INFORMATION_CLASS {
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
    static TransactionBasicInformation => 0

    /**
     * @type {Integer (Int32)}
     */
    static TransactionPropertiesInformation => 1

    /**
     * @type {Integer (Int32)}
     */
    static TransactionEnlistmentInformation => 2

    /**
     * @type {Integer (Int32)}
     */
    static TransactionSuperiorEnlistmentInformation => 3

    /**
     * @type {Integer (Int32)}
     */
    static TransactionBindInformation => 4

    /**
     * @type {Integer (Int32)}
     */
    static TransactionDTCPrivateInformation => 5
}
