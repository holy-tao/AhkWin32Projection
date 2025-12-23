#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class BANNER_NOTIFICATION_EVENT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static BNE_Rendered => 0

    /**
     * @type {Integer (Int32)}
     */
    static BNE_Hovered => 1

    /**
     * @type {Integer (Int32)}
     */
    static BNE_Closed => 2

    /**
     * @type {Integer (Int32)}
     */
    static BNE_Dismissed => 3

    /**
     * @type {Integer (Int32)}
     */
    static BNE_Button1Clicked => 4

    /**
     * @type {Integer (Int32)}
     */
    static BNE_Button2Clicked => 5
}
