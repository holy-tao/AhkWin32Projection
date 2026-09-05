#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the running states a for a report job.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmreportrunningstatus
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
class FsrmReportRunningStatus extends Win32Enum {

    /**
     * The report job status in unknown.
     * Native name: FsrmReportRunningStatus_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The report job is not running.
     * Native name: FsrmReportRunningStatus_NotRunning
     * @type {Integer (Int32)}
     */
    static NotRunning => 1

    /**
     * The report job is queued to run but is not running.
     * Native name: FsrmReportRunningStatus_Queued
     * @type {Integer (Int32)}
     */
    static Queued => 2

    /**
     * The report job is running.
     * Native name: FsrmReportRunningStatus_Running
     * @type {Integer (Int32)}
     */
    static Running => 3
}
