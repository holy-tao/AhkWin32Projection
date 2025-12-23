#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class DISPID_InkExtendedProperties extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IEPs_NewEnum => -4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IEPsItem => 0

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IEPsCount => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IEPsAdd => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IEPsRemove => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IEPsClear => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IEPsDoesPropertyExist => 5
}
