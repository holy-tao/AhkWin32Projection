#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class ASM_BIND_FLAGS{

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
