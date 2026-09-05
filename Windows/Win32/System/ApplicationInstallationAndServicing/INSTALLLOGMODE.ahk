#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class INSTALLLOGMODE extends Win32Enum {

    /**
     * Native name: INSTALLLOGMODE_FATALEXIT
     * @type {Integer (Int32)}
     */
    static FATALEXIT => 1

    /**
     * Native name: INSTALLLOGMODE_ERROR
     * @type {Integer (Int32)}
     */
    static ERROR => 2

    /**
     * Native name: INSTALLLOGMODE_WARNING
     * @type {Integer (Int32)}
     */
    static WARNING => 4

    /**
     * Native name: INSTALLLOGMODE_USER
     * @type {Integer (Int32)}
     */
    static USER => 8

    /**
     * Native name: INSTALLLOGMODE_INFO
     * @type {Integer (Int32)}
     */
    static INFO => 16

    /**
     * Native name: INSTALLLOGMODE_RESOLVESOURCE
     * @type {Integer (Int32)}
     */
    static RESOLVESOURCE => 64

    /**
     * Native name: INSTALLLOGMODE_OUTOFDISKSPACE
     * @type {Integer (Int32)}
     */
    static OUTOFDISKSPACE => 128

    /**
     * Native name: INSTALLLOGMODE_ACTIONSTART
     * @type {Integer (Int32)}
     */
    static ACTIONSTART => 256

    /**
     * Native name: INSTALLLOGMODE_ACTIONDATA
     * @type {Integer (Int32)}
     */
    static ACTIONDATA => 512

    /**
     * Native name: INSTALLLOGMODE_COMMONDATA
     * @type {Integer (Int32)}
     */
    static COMMONDATA => 2048

    /**
     * Native name: INSTALLLOGMODE_PROPERTYDUMP
     * @type {Integer (Int32)}
     */
    static PROPERTYDUMP => 1024

    /**
     * Native name: INSTALLLOGMODE_VERBOSE
     * @type {Integer (Int32)}
     */
    static VERBOSE => 4096

    /**
     * Native name: INSTALLLOGMODE_EXTRADEBUG
     * @type {Integer (Int32)}
     */
    static EXTRADEBUG => 8192

    /**
     * Native name: INSTALLLOGMODE_LOGONLYONERROR
     * @type {Integer (Int32)}
     */
    static LOGONLYONERROR => 16384

    /**
     * Native name: INSTALLLOGMODE_LOGPERFORMANCE
     * @type {Integer (Int32)}
     */
    static LOGPERFORMANCE => 32768

    /**
     * Native name: INSTALLLOGMODE_PROGRESS
     * @type {Integer (Int32)}
     */
    static PROGRESS => 1024

    /**
     * Native name: INSTALLLOGMODE_INITIALIZE
     * @type {Integer (Int32)}
     */
    static INITIALIZE => 4096

    /**
     * Native name: INSTALLLOGMODE_TERMINATE
     * @type {Integer (Int32)}
     */
    static TERMINATE => 8192

    /**
     * Native name: INSTALLLOGMODE_SHOWDIALOG
     * @type {Integer (Int32)}
     */
    static SHOWDIALOG => 16384

    /**
     * Native name: INSTALLLOGMODE_FILESINUSE
     * @type {Integer (Int32)}
     */
    static FILESINUSE => 32

    /**
     * Native name: INSTALLLOGMODE_RMFILESINUSE
     * @type {Integer (Int32)}
     */
    static RMFILESINUSE => 33554432

    /**
     * Native name: INSTALLLOGMODE_INSTALLSTART
     * @type {Integer (Int32)}
     */
    static INSTALLSTART => 67108864

    /**
     * Native name: INSTALLLOGMODE_INSTALLEND
     * @type {Integer (Int32)}
     */
    static INSTALLEND => 134217728
}
