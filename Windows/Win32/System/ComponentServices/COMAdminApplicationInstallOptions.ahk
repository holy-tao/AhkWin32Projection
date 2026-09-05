#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ComponentServices
 */
class COMAdminApplicationInstallOptions extends Win32Enum {

    /**
     * Native name: COMAdminInstallNoUsers
     * @type {Integer (Int32)}
     */
    static NoUsers => 0

    /**
     * Native name: COMAdminInstallUsers
     * @type {Integer (Int32)}
     */
    static Users => 1

    /**
     * Native name: COMAdminInstallForceOverwriteOfFiles
     * @type {Integer (Int32)}
     */
    static ForceOverwriteOfFiles => 2
}
