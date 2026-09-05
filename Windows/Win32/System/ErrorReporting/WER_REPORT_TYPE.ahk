#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ErrorReporting
 */
class WER_REPORT_TYPE extends Win32Enum {

    /**
     * Native name: WerReportNonCritical
     * @type {Integer (Int32)}
     */
    static NonCritical => 0

    /**
     * Native name: WerReportCritical
     * @type {Integer (Int32)}
     */
    static Critical => 1

    /**
     * Native name: WerReportApplicationCrash
     * @type {Integer (Int32)}
     */
    static ApplicationCrash => 2

    /**
     * Native name: WerReportApplicationHang
     * @type {Integer (Int32)}
     */
    static ApplicationHang => 3

    /**
     * Native name: WerReportKernel
     * @type {Integer (Int32)}
     */
    static Kernel => 4

    /**
     * Native name: WerReportInvalid
     * @type {Integer (Int32)}
     */
    static Invalid => 5
}
