#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class ASM_BIND_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: ASM_BINDF_FORCE_CACHE_INSTALL
     * @type {Integer (Int32)}
     */
    static BINDF_FORCE_CACHE_INSTALL => 1

    /**
     * Native name: ASM_BINDF_RFS_INTEGRITY_CHECK
     * @type {Integer (Int32)}
     */
    static BINDF_RFS_INTEGRITY_CHECK => 2

    /**
     * Native name: ASM_BINDF_RFS_MODULE_CHECK
     * @type {Integer (Int32)}
     */
    static BINDF_RFS_MODULE_CHECK => 4

    /**
     * Native name: ASM_BINDF_BINPATH_PROBE_ONLY
     * @type {Integer (Int32)}
     */
    static BINDF_BINPATH_PROBE_ONLY => 8

    /**
     * Native name: ASM_BINDF_SHARED_BINPATH_HINT
     * @type {Integer (Int32)}
     */
    static BINDF_SHARED_BINPATH_HINT => 16

    /**
     * Native name: ASM_BINDF_PARENT_ASM_HINT
     * @type {Integer (Int32)}
     */
    static BINDF_PARENT_ASM_HINT => 32
}
