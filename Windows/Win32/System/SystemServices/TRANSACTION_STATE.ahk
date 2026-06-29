#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct TRANSACTION_STATE {
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
    static TransactionStateNormal => 1

    /**
     * @type {Integer (Int32)}
     */
    static TransactionStateIndoubt => 2

    /**
     * @type {Integer (Int32)}
     */
    static TransactionStateCommittedNotify => 3
}
