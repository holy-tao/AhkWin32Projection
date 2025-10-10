#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the running states a for a report job.
 * @see https://docs.microsoft.com/windows/win32/api//fsrmenums/ne-fsrmenums-fsrmreportrunningstatus
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class FsrmReportRunningStatus{

    /**
     * The report job status in unknown.
     * @type {Integer (Int32)}
     */
    static FsrmReportRunningStatus_Unknown => 0

    /**
     * The report job is not running.
     * @type {Integer (Int32)}
     */
    static FsrmReportRunningStatus_NotRunning => 1

    /**
     * The report job is queued to run but is not running.
     * @type {Integer (Int32)}
     */
    static FsrmReportRunningStatus_Queued => 2

    /**
     * The report job is running.
     * @type {Integer (Int32)}
     */
    static FsrmReportRunningStatus_Running => 3
}
