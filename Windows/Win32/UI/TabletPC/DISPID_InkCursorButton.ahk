#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
class DISPID_InkCursorButton extends Win32Enum {

    /**
     * Native name: DISPID_ICBName
     * @type {Integer (Int32)}
     */
    static ICBName => 0

    /**
     * Native name: DISPID_ICBId
     * @type {Integer (Int32)}
     */
    static ICBId => 1

    /**
     * Native name: DISPID_ICBState
     * @type {Integer (Int32)}
     */
    static ICBState => 2
}
