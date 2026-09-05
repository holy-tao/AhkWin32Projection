#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
class DISPID_InkTablet3 extends Win32Enum {

    /**
     * Native name: DISPID_IT3IsMultiTouch
     * @type {Integer (Int32)}
     */
    static IT3IsMultiTouch => 0

    /**
     * Native name: DISPID_IT3MaximumCursors
     * @type {Integer (Int32)}
     */
    static IT3MaximumCursors => 1
}
