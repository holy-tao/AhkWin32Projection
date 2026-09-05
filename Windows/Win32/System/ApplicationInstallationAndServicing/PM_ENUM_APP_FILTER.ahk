#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class PM_ENUM_APP_FILTER extends Win32Enum {

    /**
     * Native name: PM_APP_FILTER_ALL
     * @type {Integer (Int32)}
     */
    static ALL => 0

    /**
     * Native name: PM_APP_FILTER_VISIBLE
     * @type {Integer (Int32)}
     */
    static VISIBLE => 1

    /**
     * Native name: PM_APP_FILTER_GENRE
     * @type {Integer (Int32)}
     */
    static GENRE => 2

    /**
     * Native name: PM_APP_FILTER_NONGAMES
     * @type {Integer (Int32)}
     */
    static NONGAMES => 3

    /**
     * Native name: PM_APP_FILTER_HUBTYPE
     * @type {Integer (Int32)}
     */
    static HUBTYPE => 4

    /**
     * Native name: PM_APP_FILTER_PINABLEONKIDZONE
     * @type {Integer (Int32)}
     */
    static PINABLEONKIDZONE => 5

    /**
     * Native name: PM_APP_FILTER_ALL_INCLUDE_MODERN
     * @type {Integer (Int32)}
     */
    static ALL_INCLUDE_MODERN => 6

    /**
     * Native name: PM_APP_FILTER_FRAMEWORK
     * @type {Integer (Int32)}
     */
    static FRAMEWORK => 7

    /**
     * Native name: PM_APP_FILTER_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 8
}
