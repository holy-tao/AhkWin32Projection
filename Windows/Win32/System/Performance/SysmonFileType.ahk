#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Determines the format in which the counter data is saved to a file.
 * @see https://learn.microsoft.com/windows/win32/api/isysmon/ne-isysmon-sysmonfiletype
 * @namespace Windows.Win32.System.Performance
 */
class SysmonFileType extends Win32Enum {

    /**
     * Saves the control's property settings, list of counters, and counter data as HTML to a file. If the source of the counter data is a log file, the counter data is not saved.
     * Native name: sysmonFileHtml
     * @type {Integer (Int32)}
     */
    static Html => 1

    /**
     * Saves the counter data displayed in the report view as tab-separated data to a file. If the counter data is displayed in the graph view, only the last sampled counter data is saved to the file.
     * Native name: sysmonFileReport
     * @type {Integer (Int32)}
     */
    static Report => 2

    /**
     * Saves the counter data as comma-separated data to a file.
     * Native name: sysmonFileCsv
     * @type {Integer (Int32)}
     */
    static Csv => 3

    /**
     * Saves the counter data as tab-separated data to a file.
     * Native name: sysmonFileTsv
     * @type {Integer (Int32)}
     */
    static Tsv => 4

    /**
     * Saves the counter data as binary data to a file.
     * Native name: sysmonFileBlg
     * @type {Integer (Int32)}
     */
    static Blg => 5

    /**
     * Saves the counter data in the Windows 2000 binary format to a file.
     * Native name: sysmonFileRetiredBlg
     * @type {Integer (Int32)}
     */
    static RetiredBlg => 6

    /**
     * Saves the image of the System Monitor control to a file. The image does not include the toolbar, if enabled.
     * Native name: sysmonFileGif
     * @type {Integer (Int32)}
     */
    static Gif => 7
}
