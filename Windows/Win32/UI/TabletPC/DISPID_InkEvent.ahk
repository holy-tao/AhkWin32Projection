#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
class DISPID_InkEvent extends Win32Enum {

    /**
     * Native name: DISPID_IEInkAdded
     * @type {Integer (Int32)}
     */
    static IEInkAdded => 1

    /**
     * Native name: DISPID_IEInkDeleted
     * @type {Integer (Int32)}
     */
    static IEInkDeleted => 2
}
