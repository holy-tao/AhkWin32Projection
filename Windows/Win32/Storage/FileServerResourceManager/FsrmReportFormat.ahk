#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the file formats that you can use when generating reports.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmreportformat
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class FsrmReportFormat{

    /**
     * The report format is unknown. Do not use this flag.
     * @type {Integer (Int32)}
     */
    static FsrmReportFormat_Unknown => 0

    /**
     * The report is rendered in Dynamic HTML (DHTML).
     * @type {Integer (Int32)}
     */
    static FsrmReportFormat_DHtml => 1

    /**
     * The report is rendered in HTML.
     * @type {Integer (Int32)}
     */
    static FsrmReportFormat_Html => 2

    /**
     * The report is rendered as a text file.
     * @type {Integer (Int32)}
     */
    static FsrmReportFormat_Txt => 3

    /**
     * The report is rendered as a comma-separated value file.
     * @type {Integer (Int32)}
     */
    static FsrmReportFormat_Csv => 4

    /**
     * The report is rendered in XML.
     * @type {Integer (Int32)}
     */
    static FsrmReportFormat_Xml => 5
}
