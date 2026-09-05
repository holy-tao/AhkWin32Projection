#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
class DISPID_InkExtendedProperties extends Win32Enum {

    /**
     * Native name: DISPID_IEPs_NewEnum
     * @type {Integer (Int32)}
     */
    static IEPs_NewEnum => -4

    /**
     * Native name: DISPID_IEPsItem
     * @type {Integer (Int32)}
     */
    static IEPsItem => 0

    /**
     * Native name: DISPID_IEPsCount
     * @type {Integer (Int32)}
     */
    static IEPsCount => 1

    /**
     * Native name: DISPID_IEPsAdd
     * @type {Integer (Int32)}
     */
    static IEPsAdd => 2

    /**
     * Native name: DISPID_IEPsRemove
     * @type {Integer (Int32)}
     */
    static IEPsRemove => 3

    /**
     * Native name: DISPID_IEPsClear
     * @type {Integer (Int32)}
     */
    static IEPsClear => 4

    /**
     * Native name: DISPID_IEPsDoesPropertyExist
     * @type {Integer (Int32)}
     */
    static IEPsDoesPropertyExist => 5
}
