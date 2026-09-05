#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the context in which the report is initiated.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmreportgenerationcontext
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
class FsrmReportGenerationContext extends Win32Enum {

    /**
     * The context is unknown. Do not use this flag.
     * Native name: FsrmReportGenerationContext_Undefined
     * @type {Integer (Int32)}
     */
    static Undefined => 1

    /**
     * The report will run as a scheduled report.
     * Native name: FsrmReportGenerationContext_ScheduledReport
     * @type {Integer (Int32)}
     */
    static ScheduledReport => 2

    /**
     * The report will run on demand.
     * Native name: FsrmReportGenerationContext_InteractiveReport
     * @type {Integer (Int32)}
     */
    static InteractiveReport => 3

    /**
     * The report will run in response to a quota or file screen event.
     * Native name: FsrmReportGenerationContext_IncidentReport
     * @type {Integer (Int32)}
     */
    static IncidentReport => 4
}
