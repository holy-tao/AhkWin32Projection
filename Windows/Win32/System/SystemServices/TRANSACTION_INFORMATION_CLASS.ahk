#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class TRANSACTION_INFORMATION_CLASS extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static TransactionBasicInformation => 0

    /**
     * @type {Integer (Int32)}
     */
    static TransactionPropertiesInformation => 1

    /**
     * @type {Integer (Int32)}
     */
    static TransactionEnlistmentInformation => 2

    /**
     * @type {Integer (Int32)}
     */
    static TransactionSuperiorEnlistmentInformation => 3

    /**
     * @type {Integer (Int32)}
     */
    static TransactionBindInformation => 4

    /**
     * @type {Integer (Int32)}
     */
    static TransactionDTCPrivateInformation => 5
}
