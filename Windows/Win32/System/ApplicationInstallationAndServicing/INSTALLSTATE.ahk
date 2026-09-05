#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class INSTALLSTATE extends Win32Enum {

    /**
     * Native name: INSTALLSTATE_NOTUSED
     * @type {Integer (Int32)}
     */
    static NOTUSED => -7

    /**
     * Native name: INSTALLSTATE_BADCONFIG
     * @type {Integer (Int32)}
     */
    static BADCONFIG => -6

    /**
     * Native name: INSTALLSTATE_INCOMPLETE
     * @type {Integer (Int32)}
     */
    static INCOMPLETE => -5

    /**
     * Native name: INSTALLSTATE_SOURCEABSENT
     * @type {Integer (Int32)}
     */
    static SOURCEABSENT => -4

    /**
     * Native name: INSTALLSTATE_MOREDATA
     * @type {Integer (Int32)}
     */
    static MOREDATA => -3

    /**
     * Native name: INSTALLSTATE_INVALIDARG
     * @type {Integer (Int32)}
     */
    static INVALIDARG => -2

    /**
     * Native name: INSTALLSTATE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => -1

    /**
     * Native name: INSTALLSTATE_BROKEN
     * @type {Integer (Int32)}
     */
    static BROKEN => 0

    /**
     * Native name: INSTALLSTATE_ADVERTISED
     * @type {Integer (Int32)}
     */
    static ADVERTISED => 1

    /**
     * Native name: INSTALLSTATE_REMOVED
     * @type {Integer (Int32)}
     */
    static REMOVED => 1

    /**
     * Native name: INSTALLSTATE_ABSENT
     * @type {Integer (Int32)}
     */
    static ABSENT => 2

    /**
     * Native name: INSTALLSTATE_LOCAL
     * @type {Integer (Int32)}
     */
    static LOCAL => 3

    /**
     * Native name: INSTALLSTATE_SOURCE
     * @type {Integer (Int32)}
     */
    static SOURCE => 4

    /**
     * Native name: INSTALLSTATE_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 5
}
