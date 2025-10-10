#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the format of the data in the log file.
 * @see https://docs.microsoft.com/windows/win32/api//pla/ne-pla-fileformat
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class FileFormat{

    /**
     * Comma-separated log file. The first line in the text file contains column headings followed by comma-separated data in the remaining lines of the log file.
     * @type {Integer (Int32)}
     */
    static plaCommaSeparated => 0

    /**
     * Tab-separated log file. The first line in the text file contains column headings followed by tab-separated data in the remaining lines of the log file.
     * @type {Integer (Int32)}
     */
    static plaTabSeparated => 1

    /**
     * The log contains SQL records.
     * @type {Integer (Int32)}
     */
    static plaSql => 2

    /**
     * Binary log file.
     * @type {Integer (Int32)}
     */
    static plaBinary => 3
}
