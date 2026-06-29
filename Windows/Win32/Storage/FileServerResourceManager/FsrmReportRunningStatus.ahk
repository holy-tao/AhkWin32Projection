#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the running states a for a report job.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmreportrunningstatus
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct FsrmReportRunningStatus {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
