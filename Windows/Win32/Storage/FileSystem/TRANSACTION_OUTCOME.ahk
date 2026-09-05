#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the outcomes (results) that KTM can assign to a transaction.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ne-winnt-transaction_outcome
 * @namespace Windows.Win32.Storage.FileSystem
 */
class TRANSACTION_OUTCOME extends Win32Enum {

    /**
     * The transaction has not yet been committed or rolled back.
     * Native name: TransactionOutcomeUndetermined
     * @type {Integer (Int32)}
     */
    static Undetermined => 1

    /**
     * The transaction has been committed.
     * Native name: TransactionOutcomeCommitted
     * @type {Integer (Int32)}
     */
    static Committed => 2

    /**
     * The transaction has been rolled back.
     * Native name: TransactionOutcomeAborted
     * @type {Integer (Int32)}
     */
    static Aborted => 3
}
