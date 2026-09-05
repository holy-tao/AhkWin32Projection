#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
class DISPID_PenInputPanelEvents extends Win32Enum {

    /**
     * Native name: DISPID_PIPEVisibleChanged
     * @type {Integer (Int32)}
     */
    static PIPEVisibleChanged => 0

    /**
     * Native name: DISPID_PIPEPanelChanged
     * @type {Integer (Int32)}
     */
    static PIPEPanelChanged => 1

    /**
     * Native name: DISPID_PIPEInputFailed
     * @type {Integer (Int32)}
     */
    static PIPEInputFailed => 2

    /**
     * Native name: DISPID_PIPEPanelMoving
     * @type {Integer (Int32)}
     */
    static PIPEPanelMoving => 3
}
