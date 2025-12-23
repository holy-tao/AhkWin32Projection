#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the context in which the report is initiated.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmreportgenerationcontext
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class FsrmReportGenerationContext extends Win32Enum{

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
