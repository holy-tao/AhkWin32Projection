#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class TRANSACTION_STATE extends Win32Enum {

    /**
     * Native name: TransactionStateNormal
     * @type {Integer (Int32)}
     */
    static Normal => 1

    /**
     * Native name: TransactionStateIndoubt
     * @type {Integer (Int32)}
     */
    static Indoubt => 2

    /**
     * Native name: TransactionStateCommittedNotify
     * @type {Integer (Int32)}
     */
    static CommittedNotify => 3
}
