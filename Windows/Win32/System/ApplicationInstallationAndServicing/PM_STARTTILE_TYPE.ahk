#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class PM_STARTTILE_TYPE extends Win32Enum {

    /**
     * Native name: PM_STARTTILE_TYPE_PRIMARY
     * @type {Integer (Int32)}
     */
    static PRIMARY => 1

    /**
     * Native name: PM_STARTTILE_TYPE_SECONDARY
     * @type {Integer (Int32)}
     */
    static SECONDARY => 2

    /**
     * Native name: PM_STARTTILE_TYPE_APPLIST
     * @type {Integer (Int32)}
     */
    static APPLIST => 3

    /**
     * Native name: PM_STARTTILE_TYPE_APPLISTPRIMARY
     * @type {Integer (Int32)}
     */
    static APPLISTPRIMARY => 4

    /**
     * Native name: PM_STARTTILE_TYPE_INVALID
     * @type {Integer (Int32)}
     */
    static INVALID => 5
}
