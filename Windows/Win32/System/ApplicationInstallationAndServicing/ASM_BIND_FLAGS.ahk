#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct ASM_BIND_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static ASM_BINDF_FORCE_CACHE_INSTALL => 1

    /**
     * @type {Integer (Int32)}
     */
    static ASM_BINDF_RFS_INTEGRITY_CHECK => 2

    /**
     * @type {Integer (Int32)}
     */
    static ASM_BINDF_RFS_MODULE_CHECK => 4

    /**
     * @type {Integer (Int32)}
     */
    static ASM_BINDF_BINPATH_PROBE_ONLY => 8

    /**
     * @type {Integer (Int32)}
     */
    static ASM_BINDF_SHARED_BINPATH_HINT => 16

    /**
     * @type {Integer (Int32)}
     */
    static ASM_BINDF_PARENT_ASM_HINT => 32
}
