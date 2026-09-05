#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
class DISPID_InkGesture extends Win32Enum {

    /**
     * Native name: DISPID_IGId
     * @type {Integer (Int32)}
     */
    static IGId => 0

    /**
     * Native name: DISPID_IGGetHotPoint
     * @type {Integer (Int32)}
     */
    static IGGetHotPoint => 1

    /**
     * Native name: DISPID_IGConfidence
     * @type {Integer (Int32)}
     */
    static IGConfidence => 2
}
