#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class TRANSACTION_INFORMATION_CLASS extends Win32Enum {

    /**
     * Native name: TransactionBasicInformation
     * @type {Integer (Int32)}
     */
    static BasicInformation => 0

    /**
     * Native name: TransactionPropertiesInformation
     * @type {Integer (Int32)}
     */
    static PropertiesInformation => 1

    /**
     * Native name: TransactionEnlistmentInformation
     * @type {Integer (Int32)}
     */
    static EnlistmentInformation => 2

    /**
     * Native name: TransactionSuperiorEnlistmentInformation
     * @type {Integer (Int32)}
     */
    static SuperiorEnlistmentInformation => 3

    /**
     * Native name: TransactionBindInformation
     * @type {Integer (Int32)}
     */
    static BindInformation => 4

    /**
     * @type {Integer (Int32)}
     */
    static TransactionDTCPrivateInformation => 5
}
