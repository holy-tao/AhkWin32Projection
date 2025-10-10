#Requires AutoHotkey v2.0.0 64-bit

/**
 * Represents the current transaction state of the transaction.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/ne-comsvcs-crmtransactionstate
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class CrmTransactionState{

    /**
     * The transaction is active.
     * @type {Integer (Int32)}
     */
    static TxState_Active => 0

    /**
     * The transaction is committed.
     * @type {Integer (Int32)}
     */
    static TxState_Committed => 1

    /**
     * The transaction was aborted.
     * @type {Integer (Int32)}
     */
    static TxState_Aborted => 2

    /**
     * The transaction is in doubt.
     * @type {Integer (Int32)}
     */
    static TxState_Indoubt => 3
}
