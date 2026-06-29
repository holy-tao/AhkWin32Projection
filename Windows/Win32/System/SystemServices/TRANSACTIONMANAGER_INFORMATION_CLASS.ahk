#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct TRANSACTIONMANAGER_INFORMATION_CLASS {
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
    static TransactionManagerBasicInformation => 0

    /**
     * @type {Integer (Int32)}
     */
    static TransactionManagerLogInformation => 1

    /**
     * @type {Integer (Int32)}
     */
    static TransactionManagerLogPathInformation => 2

    /**
     * @type {Integer (Int32)}
     */
    static TransactionManagerRecoveryInformation => 4

    /**
     * @type {Integer (Int32)}
     */
    static TransactionManagerOnlineProbeInformation => 3

    /**
     * @type {Integer (Int32)}
     */
    static TransactionManagerOldestTransactionInformation => 5
}
