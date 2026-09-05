#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
class DISPID_InkExtendedProperty extends Win32Enum {

    /**
     * Native name: DISPID_IEPGuid
     * @type {Integer (Int32)}
     */
    static IEPGuid => 1

    /**
     * Native name: DISPID_IEPData
     * @type {Integer (Int32)}
     */
    static IEPData => 2
}
