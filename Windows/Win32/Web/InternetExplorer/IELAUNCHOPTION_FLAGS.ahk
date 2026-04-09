#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
class IELAUNCHOPTION_FLAGS extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static IELAUNCHOPTION_SCRIPTDEBUG => 1

    /**
     * @type {Integer (Int32)}
     */
    static IELAUNCHOPTION_FORCE_COMPAT => 2

    /**
     * @type {Integer (Int32)}
     */
    static IELAUNCHOPTION_FORCE_EDGE => 4

    /**
     * @type {Integer (Int32)}
     */
    static IELAUNCHOPTION_LOCK_ENGINE => 8
}
