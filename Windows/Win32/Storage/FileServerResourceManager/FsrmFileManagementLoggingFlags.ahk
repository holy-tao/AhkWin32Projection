#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the options for logging when running a file management job.
 * @see https://docs.microsoft.com/windows/win32/api//fsrmenums/ne-fsrmenums-fsrmfilemanagementloggingflags
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class FsrmFileManagementLoggingFlags extends Win32Enum{

    /**
     * Do not log events.
     * @type {Integer (Int32)}
     */
    static FsrmFileManagementLoggingFlags_None => 0

    /**
     * Log errors that occur when running the file management job to a log file.
     * @type {Integer (Int32)}
     */
    static FsrmFileManagementLoggingFlags_Error => 1

    /**
     * Log information status messages that occur when running the file management job to a log file.
     * @type {Integer (Int32)}
     */
    static FsrmFileManagementLoggingFlags_Information => 2

    /**
     * Log information about every file that met all of the file management job's conditions to the Security audit 
     *       log.
     * @type {Integer (Int32)}
     */
    static FsrmFileManagementLoggingFlags_Audit => 4
}
