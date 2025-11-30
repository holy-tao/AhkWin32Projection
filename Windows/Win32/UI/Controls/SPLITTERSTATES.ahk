#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class SPLITTERSTATES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SPLITS_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static SPLITS_HOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static SPLITS_PRESSED => 3
}
