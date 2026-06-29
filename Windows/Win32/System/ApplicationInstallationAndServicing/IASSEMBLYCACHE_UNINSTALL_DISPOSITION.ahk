#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct IASSEMBLYCACHE_UNINSTALL_DISPOSITION {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
