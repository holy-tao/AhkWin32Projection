#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class AUTHENTICATION_LEVEL extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NO_AUTHENTICATION_REQUIRED => 0

    /**
     * @type {Integer (Int32)}
     */
    static INCOMING_AUTHENTICATION_REQUIRED => 1

    /**
     * @type {Integer (Int32)}
     */
    static MUTUAL_AUTHENTICATION_REQUIRED => 2
}
