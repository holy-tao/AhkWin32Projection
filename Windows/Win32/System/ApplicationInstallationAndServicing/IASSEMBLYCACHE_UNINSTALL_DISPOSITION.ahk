#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The assembly does not exist in the side-by-side store.
 * @see https://learn.microsoft.com/windows/win32/api//content/winsxs/nf-winsxs-iassemblycache-uninstallassembly
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
