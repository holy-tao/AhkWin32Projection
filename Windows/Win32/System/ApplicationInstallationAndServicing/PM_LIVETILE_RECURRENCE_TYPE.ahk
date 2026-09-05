#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class PM_LIVETILE_RECURRENCE_TYPE extends Win32Enum {

    /**
     * Native name: PM_LIVETILE_RECURRENCE_TYPE_INSTANT
     * @type {Integer (Int32)}
     */
    static INSTANT => 0

    /**
     * Native name: PM_LIVETILE_RECURRENCE_TYPE_ONETIME
     * @type {Integer (Int32)}
     */
    static ONETIME => 1

    /**
     * Native name: PM_LIVETILE_RECURRENCE_TYPE_INTERVAL
     * @type {Integer (Int32)}
     */
    static INTERVAL => 2

    /**
     * Native name: PM_LIVETILE_RECURRENCE_TYPE_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 2
}
