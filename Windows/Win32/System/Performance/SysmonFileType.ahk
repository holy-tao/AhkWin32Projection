#Requires AutoHotkey v2.0.0 64-bit

/**
 * Determines the format in which the counter data is saved to a file.
 * @see https://docs.microsoft.com/windows/win32/api//isysmon/ne-isysmon-sysmonfiletype
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class SysmonFileType{

    /**
     * Saves the control's property settings, list of counters, and counter data as HTML to a file. If the source of the counter data is a log file, the counter data is not saved.
     * @type {Integer (Int32)}
     */
    static sysmonFileHtml => 1

    /**
     * Saves the counter data displayed in the report view as tab-separated data to a file. If the counter data is displayed in the graph view, only the last sampled counter data is saved to the file.
     * @type {Integer (Int32)}
     */
    static sysmonFileReport => 2

    /**
     * Saves the counter data as comma-separated data to a file.
     * @type {Integer (Int32)}
     */
    static sysmonFileCsv => 3

    /**
     * Saves the counter data as tab-separated data to a file.
     * @type {Integer (Int32)}
     */
    static sysmonFileTsv => 4

    /**
     * Saves the counter data as binary data to a file.
     * @type {Integer (Int32)}
     */
    static sysmonFileBlg => 5

    /**
     * Saves the counter data in the Windows 2000 binary format to a file.
     * @type {Integer (Int32)}
     */
    static sysmonFileRetiredBlg => 6

    /**
     * Saves the image of the System Monitor control to a file. The image does not include the toolbar, if enabled.
     * @type {Integer (Int32)}
     */
    static sysmonFileGif => 7
}
