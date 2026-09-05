#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class PM_LOGO_SIZE extends Win32Enum {

    /**
     * Native name: PM_LOGO_SIZE_SMALL
     * @type {Integer (Int32)}
     */
    static SMALL => 0

    /**
     * Native name: PM_LOGO_SIZE_MEDIUM
     * @type {Integer (Int32)}
     */
    static MEDIUM => 1

    /**
     * Native name: PM_LOGO_SIZE_LARGE
     * @type {Integer (Int32)}
     */
    static LARGE => 2

    /**
     * Native name: PM_LOGO_SIZE_INVALID
     * @type {Integer (Int32)}
     */
    static INVALID => 3
}
