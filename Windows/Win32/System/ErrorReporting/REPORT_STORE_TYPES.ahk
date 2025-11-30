#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ErrorReporting
 * @version v4.0.30319
 */
class REPORT_STORE_TYPES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static E_STORE_USER_ARCHIVE => 0

    /**
     * @type {Integer (Int32)}
     */
    static E_STORE_USER_QUEUE => 1

    /**
     * @type {Integer (Int32)}
     */
    static E_STORE_MACHINE_ARCHIVE => 2

    /**
     * @type {Integer (Int32)}
     */
    static E_STORE_MACHINE_QUEUE => 3

    /**
     * @type {Integer (Int32)}
     */
    static E_STORE_INVALID => 4
}
