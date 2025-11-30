#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class TASKBANDPARTS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static TDP_GROUPCOUNT => 1

    /**
     * @type {Integer (Int32)}
     */
    static TDP_FLASHBUTTON => 2

    /**
     * @type {Integer (Int32)}
     */
    static TDP_FLASHBUTTONGROUPMENU => 3
}
