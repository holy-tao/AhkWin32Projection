#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class SCRIPTUICITEM extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTUICITEM_INPUTBOX => 1

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTUICITEM_MSGBOX => 2
}
