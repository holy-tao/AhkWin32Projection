#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
class FRAMEOPTIONS_FLAGS extends Win32Enum {

    /**
     * Native name: FRAMEOPTIONS_SCROLL_YES
     * @type {Integer (Int32)}
     */
    static SCROLL_YES => 1

    /**
     * Native name: FRAMEOPTIONS_SCROLL_NO
     * @type {Integer (Int32)}
     */
    static SCROLL_NO => 2

    /**
     * Native name: FRAMEOPTIONS_SCROLL_AUTO
     * @type {Integer (Int32)}
     */
    static SCROLL_AUTO => 4

    /**
     * Native name: FRAMEOPTIONS_NORESIZE
     * @type {Integer (Int32)}
     */
    static NORESIZE => 8

    /**
     * Native name: FRAMEOPTIONS_NO3DBORDER
     * @type {Integer (Int32)}
     */
    static NO3DBORDER => 16

    /**
     * Native name: FRAMEOPTIONS_DESKTOP
     * @type {Integer (Int32)}
     */
    static DESKTOP => 32

    /**
     * Native name: FRAMEOPTIONS_BROWSERBAND
     * @type {Integer (Int32)}
     */
    static BROWSERBAND => 64
}
