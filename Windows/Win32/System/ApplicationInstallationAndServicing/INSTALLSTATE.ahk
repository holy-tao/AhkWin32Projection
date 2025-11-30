#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class INSTALLSTATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLSTATE_NOTUSED => -7

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLSTATE_BADCONFIG => -6

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLSTATE_INCOMPLETE => -5

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLSTATE_SOURCEABSENT => -4

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLSTATE_MOREDATA => -3

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLSTATE_INVALIDARG => -2

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLSTATE_UNKNOWN => -1

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLSTATE_BROKEN => 0

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLSTATE_ADVERTISED => 1

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLSTATE_REMOVED => 1

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLSTATE_ABSENT => 2

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLSTATE_LOCAL => 3

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLSTATE_SOURCE => 4

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLSTATE_DEFAULT => 5
}
