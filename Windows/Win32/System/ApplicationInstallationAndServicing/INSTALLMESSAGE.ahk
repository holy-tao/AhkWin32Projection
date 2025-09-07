#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class INSTALLMESSAGE{

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLMESSAGE_FATALEXIT => 0

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLMESSAGE_ERROR => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLMESSAGE_WARNING => 33554432

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLMESSAGE_USER => 50331648

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLMESSAGE_INFO => 67108864

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLMESSAGE_FILESINUSE => 83886080

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLMESSAGE_RESOLVESOURCE => 100663296

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLMESSAGE_OUTOFDISKSPACE => 117440512

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLMESSAGE_ACTIONSTART => 134217728

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLMESSAGE_ACTIONDATA => 150994944

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLMESSAGE_PROGRESS => 167772160

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLMESSAGE_COMMONDATA => 184549376

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLMESSAGE_INITIALIZE => 201326592

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLMESSAGE_TERMINATE => 218103808

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLMESSAGE_SHOWDIALOG => 234881024

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLMESSAGE_PERFORMANCE => 251658240

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLMESSAGE_RMFILESINUSE => 419430400

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLMESSAGE_INSTALLSTART => 436207616

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLMESSAGE_INSTALLEND => 452984832
}
