#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IASSEMBLYCACHE_UNINSTALL_DISPOSITION extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static IASSEMBLYCACHE_UNINSTALL_DISPOSITION_UNINSTALLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IASSEMBLYCACHE_UNINSTALL_DISPOSITION_STILL_IN_USE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IASSEMBLYCACHE_UNINSTALL_DISPOSITION_ALREADY_UNINSTALLED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IASSEMBLYCACHE_UNINSTALL_DISPOSITION_DELETE_PENDING => 4
}
