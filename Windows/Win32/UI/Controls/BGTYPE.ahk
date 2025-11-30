#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class BGTYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static BT_IMAGEFILE => 0

    /**
     * @type {Integer (Int32)}
     */
    static BT_BORDERFILL => 1

    /**
     * @type {Integer (Int32)}
     */
    static BT_NONE => 2
}
