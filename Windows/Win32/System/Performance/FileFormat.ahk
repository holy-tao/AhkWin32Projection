#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the format of the data in the log file.
 * @see https://learn.microsoft.com/windows/win32/api/pla/ne-pla-fileformat
 * @namespace Windows.Win32.System.Performance
 */
export default struct FileFormat {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
