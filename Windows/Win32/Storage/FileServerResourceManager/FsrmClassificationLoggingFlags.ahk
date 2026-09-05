#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the different options for logging information while running classification.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmclassificationloggingflags
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
class FsrmClassificationLoggingFlags extends Win32Enum {

    /**
     * No logging occurs.
     * Native name: FsrmClassificationLoggingFlags_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Logs to a log file information about all the files and properties that were classified.
     * Native name: FsrmClassificationLoggingFlags_ClassificationsInLogFile
     * @type {Integer (Int32)}
     */
    static ClassificationsInLogFile => 1

    /**
     * Logs to a log file errors that occurred during classification.
     * Native name: FsrmClassificationLoggingFlags_ErrorsInLogFile
     * @type {Integer (Int32)}
     */
    static ErrorsInLogFile => 2

    /**
     * Logs to the System event information about all the files and properties that were classified.
     * Native name: FsrmClassificationLoggingFlags_ClassificationsInSystemLog
     * @type {Integer (Int32)}
     */
    static ClassificationsInSystemLog => 4

    /**
     * Logs to the System event log errors that occurred during classification.
     * Native name: FsrmClassificationLoggingFlags_ErrorsInSystemLog
     * @type {Integer (Int32)}
     */
    static ErrorsInSystemLog => 8
}
