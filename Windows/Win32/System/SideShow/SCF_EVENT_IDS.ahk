#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SideShow
 * @version v4.0.30319
 */
class SCF_EVENT_IDS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SCF_EVENT_NAVIGATION => 1

    /**
     * @type {Integer (Int32)}
     */
    static SCF_EVENT_MENUACTION => 2

    /**
     * @type {Integer (Int32)}
     */
    static SCF_EVENT_CONTEXTMENU => 3
}
