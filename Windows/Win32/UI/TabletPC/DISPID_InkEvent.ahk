#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class DISPID_InkEvent extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IEInkAdded => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IEInkDeleted => 2
}
