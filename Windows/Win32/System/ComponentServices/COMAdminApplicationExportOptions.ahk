#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ComponentServices
 */
class COMAdminApplicationExportOptions extends Win32Enum {

    /**
     * Native name: COMAdminExportNoUsers
     * @type {Integer (Int32)}
     */
    static NoUsers => 0

    /**
     * Native name: COMAdminExportUsers
     * @type {Integer (Int32)}
     */
    static Users => 1

    /**
     * Native name: COMAdminExportApplicationProxy
     * @type {Integer (Int32)}
     */
    static ApplicationProxy => 2

    /**
     * Native name: COMAdminExportForceOverwriteOfFiles
     * @type {Integer (Int32)}
     */
    static ForceOverwriteOfFiles => 4

    /**
     * Native name: COMAdminExportIn10Format
     * @type {Integer (Int32)}
     */
    static In10Format => 16
}
