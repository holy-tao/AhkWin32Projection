#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ErrorReporting
 */
class WER_SUBMIT_RESULT extends Win32Enum {

    /**
     * Native name: WerReportQueued
     * @type {Integer (Int32)}
     */
    static ReportQueued => 1

    /**
     * Native name: WerReportUploaded
     * @type {Integer (Int32)}
     */
    static ReportUploaded => 2

    /**
     * Native name: WerReportDebug
     * @type {Integer (Int32)}
     */
    static ReportDebug => 3

    /**
     * Native name: WerReportFailed
     * @type {Integer (Int32)}
     */
    static ReportFailed => 4

    /**
     * Native name: WerDisabled
     * @type {Integer (Int32)}
     */
    static Disabled => 5

    /**
     * Native name: WerReportCancelled
     * @type {Integer (Int32)}
     */
    static ReportCancelled => 6

    /**
     * Native name: WerDisabledQueue
     * @type {Integer (Int32)}
     */
    static DisabledQueue => 7

    /**
     * Native name: WerReportAsync
     * @type {Integer (Int32)}
     */
    static ReportAsync => 8

    /**
     * Native name: WerCustomAction
     * @type {Integer (Int32)}
     */
    static CustomAction => 9

    /**
     * Native name: WerThrottled
     * @type {Integer (Int32)}
     */
    static Throttled => 10

    /**
     * Native name: WerReportUploadedCab
     * @type {Integer (Int32)}
     */
    static ReportUploadedCab => 11

    /**
     * Native name: WerStorageLocationNotFound
     * @type {Integer (Int32)}
     */
    static StorageLocationNotFound => 12

    /**
     * Native name: WerSubmitResultMax
     * @type {Integer (Int32)}
     */
    static Max => 13
}
