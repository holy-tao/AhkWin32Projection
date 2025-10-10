#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the different options for logging information while running classification.
 * @see https://docs.microsoft.com/windows/win32/api//fsrmenums/ne-fsrmenums-fsrmclassificationloggingflags
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class FsrmClassificationLoggingFlags{

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
