#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the outcomes (results) that KTM can assign to a transaction.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ne-winnt-transaction_outcome
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct TRANSACTION_OUTCOME {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The transaction has not yet been committed or rolled back.
     * @type {Integer (Int32)}
     */
    static TransactionOutcomeUndetermined => 1

    /**
     * The transaction has been committed.
     * @type {Integer (Int32)}
     */
    static TransactionOutcomeCommitted => 2

    /**
     * The transaction has been rolled back.
     * @type {Integer (Int32)}
     */
    static TransactionOutcomeAborted => 3
}
