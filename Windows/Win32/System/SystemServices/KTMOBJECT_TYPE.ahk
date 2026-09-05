#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class KTMOBJECT_TYPE extends Win32Enum {

    /**
     * Native name: KTMOBJECT_TRANSACTION
     * @type {Integer (Int32)}
     */
    static TRANSACTION => 0

    /**
     * Native name: KTMOBJECT_TRANSACTION_MANAGER
     * @type {Integer (Int32)}
     */
    static TRANSACTION_MANAGER => 1

    /**
     * Native name: KTMOBJECT_RESOURCE_MANAGER
     * @type {Integer (Int32)}
     */
    static RESOURCE_MANAGER => 2

    /**
     * Native name: KTMOBJECT_ENLISTMENT
     * @type {Integer (Int32)}
     */
    static ENLISTMENT => 3

    /**
     * Native name: KTMOBJECT_INVALID
     * @type {Integer (Int32)}
     */
    static INVALID => 4
}
