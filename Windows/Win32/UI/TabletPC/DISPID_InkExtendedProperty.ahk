#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class DISPID_InkExtendedProperty extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IEPGuid => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IEPData => 2
}
