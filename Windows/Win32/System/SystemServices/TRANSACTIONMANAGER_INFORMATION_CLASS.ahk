#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class TRANSACTIONMANAGER_INFORMATION_CLASS{

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
