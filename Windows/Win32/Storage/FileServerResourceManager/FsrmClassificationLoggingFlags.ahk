#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the different options for logging information while running classification.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmclassificationloggingflags
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct FsrmClassificationLoggingFlags {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No logging occurs.
     * @type {Integer (Int32)}
     */
    static FsrmClassificationLoggingFlags_None => 0

    /**
     * Logs to a log file information about all the files and properties that were classified.
     * @type {Integer (Int32)}
     */
    static FsrmClassificationLoggingFlags_ClassificationsInLogFile => 1

    /**
     * Logs to a log file errors that occurred during classification.
     * @type {Integer (Int32)}
     */
    static FsrmClassificationLoggingFlags_ErrorsInLogFile => 2

    /**
     * Logs to the System event information about all the files and properties that were classified.
     * @type {Integer (Int32)}
     */
    static FsrmClassificationLoggingFlags_ClassificationsInSystemLog => 4

    /**
     * Logs to the System event log errors that occurred during classification.
     * @type {Integer (Int32)}
     */
    static FsrmClassificationLoggingFlags_ErrorsInSystemLog => 8
}
