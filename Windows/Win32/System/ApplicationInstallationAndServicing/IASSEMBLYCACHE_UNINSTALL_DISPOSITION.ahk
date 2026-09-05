#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class IASSEMBLYCACHE_UNINSTALL_DISPOSITION extends Win32Enum {

    /**
     * Native name: IASSEMBLYCACHE_UNINSTALL_DISPOSITION_UNINSTALLED
     * @type {Integer (UInt32)}
     */
    static UNINSTALLED => 1

    /**
     * Native name: IASSEMBLYCACHE_UNINSTALL_DISPOSITION_STILL_IN_USE
     * @type {Integer (UInt32)}
     */
    static STILL_IN_USE => 2

    /**
     * Native name: IASSEMBLYCACHE_UNINSTALL_DISPOSITION_ALREADY_UNINSTALLED
     * @type {Integer (UInt32)}
     */
    static ALREADY_UNINSTALLED => 3

    /**
     * Native name: IASSEMBLYCACHE_UNINSTALL_DISPOSITION_DELETE_PENDING
     * @type {Integer (UInt32)}
     */
    static DELETE_PENDING => 4
}
