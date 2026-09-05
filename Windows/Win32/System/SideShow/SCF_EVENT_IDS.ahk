#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SideShow
 */
class SCF_EVENT_IDS extends Win32Enum {

    /**
     * Native name: SCF_EVENT_NAVIGATION
     * @type {Integer (Int32)}
     */
    static NAVIGATION => 1

    /**
     * Native name: SCF_EVENT_MENUACTION
     * @type {Integer (Int32)}
     */
    static MENUACTION => 2

    /**
     * Native name: SCF_EVENT_CONTEXTMENU
     * @type {Integer (Int32)}
     */
    static CONTEXTMENU => 3
}
