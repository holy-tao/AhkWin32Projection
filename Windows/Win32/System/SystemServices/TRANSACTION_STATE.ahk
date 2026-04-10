#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class TRANSACTION_STATE extends Win32Enum {

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
