#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class INSTALLMESSAGE extends Win32Enum {

    /**
     * Native name: INSTALLMESSAGE_FATALEXIT
     * @type {Integer (Int32)}
     */
    static FATALEXIT => 0

    /**
     * Native name: INSTALLMESSAGE_ERROR
     * @type {Integer (Int32)}
     */
    static ERROR => 16777216

    /**
     * Native name: INSTALLMESSAGE_WARNING
     * @type {Integer (Int32)}
     */
    static WARNING => 33554432

    /**
     * Native name: INSTALLMESSAGE_USER
     * @type {Integer (Int32)}
     */
    static USER => 50331648

    /**
     * Native name: INSTALLMESSAGE_INFO
     * @type {Integer (Int32)}
     */
    static INFO => 67108864

    /**
     * Native name: INSTALLMESSAGE_FILESINUSE
     * @type {Integer (Int32)}
     */
    static FILESINUSE => 83886080

    /**
     * Native name: INSTALLMESSAGE_RESOLVESOURCE
     * @type {Integer (Int32)}
     */
    static RESOLVESOURCE => 100663296

    /**
     * Native name: INSTALLMESSAGE_OUTOFDISKSPACE
     * @type {Integer (Int32)}
     */
    static OUTOFDISKSPACE => 117440512

    /**
     * Native name: INSTALLMESSAGE_ACTIONSTART
     * @type {Integer (Int32)}
     */
    static ACTIONSTART => 134217728

    /**
     * Native name: INSTALLMESSAGE_ACTIONDATA
     * @type {Integer (Int32)}
     */
    static ACTIONDATA => 150994944

    /**
     * Native name: INSTALLMESSAGE_PROGRESS
     * @type {Integer (Int32)}
     */
    static PROGRESS => 167772160

    /**
     * Native name: INSTALLMESSAGE_COMMONDATA
     * @type {Integer (Int32)}
     */
    static COMMONDATA => 184549376

    /**
     * Native name: INSTALLMESSAGE_INITIALIZE
     * @type {Integer (Int32)}
     */
    static INITIALIZE => 201326592

    /**
     * Native name: INSTALLMESSAGE_TERMINATE
     * @type {Integer (Int32)}
     */
    static TERMINATE => 218103808

    /**
     * Native name: INSTALLMESSAGE_SHOWDIALOG
     * @type {Integer (Int32)}
     */
    static SHOWDIALOG => 234881024

    /**
     * Native name: INSTALLMESSAGE_PERFORMANCE
     * @type {Integer (Int32)}
     */
    static PERFORMANCE => 251658240

    /**
     * Native name: INSTALLMESSAGE_RMFILESINUSE
     * @type {Integer (Int32)}
     */
    static RMFILESINUSE => 419430400

    /**
     * Native name: INSTALLMESSAGE_INSTALLSTART
     * @type {Integer (Int32)}
     */
    static INSTALLSTART => 436207616

    /**
     * Native name: INSTALLMESSAGE_INSTALLEND
     * @type {Integer (Int32)}
     */
    static INSTALLEND => 452984832
}
