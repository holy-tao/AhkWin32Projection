#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the context in which the report is initiated.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmreportgenerationcontext
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct FsrmReportGenerationContext {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The context is unknown. Do not use this flag.
     * @type {Integer (Int32)}
     */
    static FsrmReportGenerationContext_Undefined => 1

    /**
     * The report will run as a scheduled report.
     * @type {Integer (Int32)}
     */
    static FsrmReportGenerationContext_ScheduledReport => 2

    /**
     * The report will run on demand.
     * @type {Integer (Int32)}
     */
    static FsrmReportGenerationContext_InteractiveReport => 3

    /**
     * The report will run in response to a quota or file screen event.
     * @type {Integer (Int32)}
     */
    static FsrmReportGenerationContext_IncidentReport => 4
}
