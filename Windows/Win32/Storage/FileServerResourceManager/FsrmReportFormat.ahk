#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the file formats that you can use when generating reports.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmreportformat
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
class FsrmReportFormat extends Win32Enum {

    /**
     * The report format is unknown. Do not use this flag.
     * Native name: FsrmReportFormat_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The report is rendered in Dynamic HTML (DHTML).
     * Native name: FsrmReportFormat_DHtml
     * @type {Integer (Int32)}
     */
    static DHtml => 1

    /**
     * The report is rendered in HTML.
     * Native name: FsrmReportFormat_Html
     * @type {Integer (Int32)}
     */
    static Html => 2

    /**
     * The report is rendered as a text file.
     * Native name: FsrmReportFormat_Txt
     * @type {Integer (Int32)}
     */
    static Txt => 3

    /**
     * The report is rendered as a comma-separated value file.
     * Native name: FsrmReportFormat_Csv
     * @type {Integer (Int32)}
     */
    static Csv => 4

    /**
     * The report is rendered in XML.
     * Native name: FsrmReportFormat_Xml
     * @type {Integer (Int32)}
     */
    static Xml => 5
}
