#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class KTMOBJECT_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KTMOBJECT_TRANSACTION => 0

    /**
     * @type {Integer (Int32)}
     */
    static KTMOBJECT_TRANSACTION_MANAGER => 1

    /**
     * @type {Integer (Int32)}
     */
    static KTMOBJECT_RESOURCE_MANAGER => 2

    /**
     * @type {Integer (Int32)}
     */
    static KTMOBJECT_ENLISTMENT => 3

    /**
     * @type {Integer (Int32)}
     */
    static KTMOBJECT_INVALID => 4
}
