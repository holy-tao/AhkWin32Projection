#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
class SCRIPTUICITEM extends Win32Enum {

    /**
     * Native name: SCRIPTUICITEM_INPUTBOX
     * @type {Integer (Int32)}
     */
    static INPUTBOX => 1

    /**
     * Native name: SCRIPTUICITEM_MSGBOX
     * @type {Integer (Int32)}
     */
    static MSGBOX => 2
}
