#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents the current transaction state of the transaction.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/ne-comsvcs-crmtransactionstate
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct CrmTransactionState {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
