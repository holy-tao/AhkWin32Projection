#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class COMAdminApplicationInstallOptions extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminInstallNoUsers => 0

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminInstallUsers => 1

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminInstallForceOverwriteOfFiles => 2
}
