#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the readiness of an object to commit or abort the current transaction.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/ne-comsvcs-transactionvote
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class TransactionVote extends Win32Enum{

    /**
     * An existing object votes to commit the current transaction.
     * @type {Integer (Int32)}
     */
    static TxCommit => 0

    /**
     * An existing object votes to abort the current transaction.
     * @type {Integer (Int32)}
     */
    static TxAbort => 1
}
