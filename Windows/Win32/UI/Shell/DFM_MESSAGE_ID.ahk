#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class DFM_MESSAGE_ID extends Win32Enum {

    /**
     * Native name: DFM_MERGECONTEXTMENU
     * @type {Integer (Int32)}
     */
    static MERGECONTEXTMENU => 1

    /**
     * Native name: DFM_INVOKECOMMAND
     * @type {Integer (Int32)}
     */
    static INVOKECOMMAND => 2

    /**
     * Native name: DFM_GETHELPTEXT
     * @type {Integer (Int32)}
     */
    static GETHELPTEXT => 5

    /**
     * Native name: DFM_WM_MEASUREITEM
     * @type {Integer (Int32)}
     */
    static WM_MEASUREITEM => 6

    /**
     * Native name: DFM_WM_DRAWITEM
     * @type {Integer (Int32)}
     */
    static WM_DRAWITEM => 7

    /**
     * Native name: DFM_WM_INITMENUPOPUP
     * @type {Integer (Int32)}
     */
    static WM_INITMENUPOPUP => 8

    /**
     * Native name: DFM_VALIDATECMD
     * @type {Integer (Int32)}
     */
    static VALIDATECMD => 9

    /**
     * Native name: DFM_MERGECONTEXTMENU_TOP
     * @type {Integer (Int32)}
     */
    static MERGECONTEXTMENU_TOP => 10

    /**
     * Native name: DFM_GETHELPTEXTW
     * @type {Integer (Int32)}
     */
    static GETHELPTEXTW => 11

    /**
     * Native name: DFM_INVOKECOMMANDEX
     * @type {Integer (Int32)}
     */
    static INVOKECOMMANDEX => 12

    /**
     * Native name: DFM_MAPCOMMANDNAME
     * @type {Integer (Int32)}
     */
    static MAPCOMMANDNAME => 13

    /**
     * Native name: DFM_GETDEFSTATICID
     * @type {Integer (Int32)}
     */
    static GETDEFSTATICID => 14

    /**
     * Native name: DFM_GETVERBW
     * @type {Integer (Int32)}
     */
    static GETVERBW => 15

    /**
     * Native name: DFM_GETVERBA
     * @type {Integer (Int32)}
     */
    static GETVERBA => 16

    /**
     * Native name: DFM_MERGECONTEXTMENU_BOTTOM
     * @type {Integer (Int32)}
     */
    static MERGECONTEXTMENU_BOTTOM => 17

    /**
     * Native name: DFM_MODIFYQCMFLAGS
     * @type {Integer (Int32)}
     */
    static MODIFYQCMFLAGS => 18
}
