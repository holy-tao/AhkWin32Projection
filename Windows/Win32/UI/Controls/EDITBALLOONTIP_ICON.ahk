#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class EDITBALLOONTIP_ICON extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static TTI_ERROR => 3

    /**
     * @type {Integer (Int32)}
     */
    static TTI_INFO => 1

    /**
     * @type {Integer (Int32)}
     */
    static TTI_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static TTI_WARNING => 2

    /**
     * @type {Integer (Int32)}
     */
    static TTI_INFO_LARGE => 4

    /**
     * @type {Integer (Int32)}
     */
    static TTI_WARNING_LARGE => 5

    /**
     * @type {Integer (Int32)}
     */
    static TTI_ERROR_LARGE => 6
}
