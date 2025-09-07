#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.ErrorReporting
 * @version v4.0.30319
 */
class WER_REPORT_TYPE{

    /**
     * @type {Integer (Int32)}
     */
    static WerReportNonCritical => 0

    /**
     * @type {Integer (Int32)}
     */
    static WerReportCritical => 1

    /**
     * @type {Integer (Int32)}
     */
    static WerReportApplicationCrash => 2

    /**
     * @type {Integer (Int32)}
     */
    static WerReportApplicationHang => 3

    /**
     * @type {Integer (Int32)}
     */
    static WerReportKernel => 4

    /**
     * @type {Integer (Int32)}
     */
    static WerReportInvalid => 5
}
