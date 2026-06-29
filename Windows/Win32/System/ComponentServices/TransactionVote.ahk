#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates the readiness of an object to commit or abort the current transaction.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/ne-comsvcs-transactionvote
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct TransactionVote {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
