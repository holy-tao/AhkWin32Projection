#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.InternetConnectionWizard
 * @version v4.0.30319
 */
class InternetConnectionWizard {

;@region Constants

    /**
     * @type {String}
     */
    static ICW_REGPATHSETTINGS => "Software\Microsoft\Internet Connection Wizard"

    /**
     * @type {String}
     */
    static ICW_REGKEYCOMPLETED => "Completed"

    /**
     * @type {Integer (UInt32)}
     */
    static ICW_MAX_ACCTNAME => 256

    /**
     * @type {Integer (UInt32)}
     */
    static ICW_MAX_PASSWORD => 256

    /**
     * @type {Integer (UInt32)}
     */
    static ICW_MAX_LOGONNAME => 256

    /**
     * @type {Integer (UInt32)}
     */
    static ICW_MAX_SERVERNAME => 64

    /**
     * @type {Integer (UInt32)}
     */
    static ICW_MAX_RASNAME => 256

    /**
     * @type {Integer (UInt32)}
     */
    static ICW_MAX_EMAILNAME => 64

    /**
     * @type {Integer (UInt32)}
     */
    static ICW_MAX_EMAILADDR => 128

    /**
     * @type {Integer (UInt32)}
     */
    static ICW_CHECKSTATUS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ICW_LAUNCHFULL => 256

    /**
     * @type {Integer (UInt32)}
     */
    static ICW_LAUNCHMANUAL => 512

    /**
     * @type {Integer (UInt32)}
     */
    static ICW_USE_SHELLNEXT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static ICW_FULL_SMARTSTART => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static ICW_FULLPRESENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ICW_MANUALPRESENT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ICW_ALREADYRUN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ICW_LAUNCHEDFULL => 256

    /**
     * @type {Integer (UInt32)}
     */
    static ICW_LAUNCHEDMANUAL => 512

    /**
     * @type {Integer (UInt32)}
     */
    static ICW_USEDEFAULTS => 1
;@endregion Constants

;@region Methods
;@endregion Methods
}
