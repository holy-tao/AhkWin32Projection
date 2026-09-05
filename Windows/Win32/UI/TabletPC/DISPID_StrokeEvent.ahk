#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
class DISPID_StrokeEvent extends Win32Enum {

    /**
     * Native name: DISPID_SEStrokesAdded
     * @type {Integer (Int32)}
     */
    static SEStrokesAdded => 1

    /**
     * Native name: DISPID_SEStrokesRemoved
     * @type {Integer (Int32)}
     */
    static SEStrokesRemoved => 2
}
