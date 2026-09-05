#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
class IELAUNCHOPTION_FLAGS extends Win32Enum {

    /**
     * Native name: IELAUNCHOPTION_SCRIPTDEBUG
     * @type {Integer (Int32)}
     */
    static SCRIPTDEBUG => 1

    /**
     * Native name: IELAUNCHOPTION_FORCE_COMPAT
     * @type {Integer (Int32)}
     */
    static FORCE_COMPAT => 2

    /**
     * Native name: IELAUNCHOPTION_FORCE_EDGE
     * @type {Integer (Int32)}
     */
    static FORCE_EDGE => 4

    /**
     * Native name: IELAUNCHOPTION_LOCK_ENGINE
     * @type {Integer (Int32)}
     */
    static LOCK_ENGINE => 8
}
