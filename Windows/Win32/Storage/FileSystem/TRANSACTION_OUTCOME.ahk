#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the outcomes (results) that KTM can assign to a transaction.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ne-winnt-transaction_outcome
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class TRANSACTION_OUTCOME{

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
