#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
class STARTUP_FLAGS extends Win32Enum {

    /**
     * Native name: STARTUP_CONCURRENT_GC
     * @type {Integer (Int32)}
     */
    static CONCURRENT_GC => 1

    /**
     * Native name: STARTUP_LOADER_OPTIMIZATION_MASK
     * @type {Integer (Int32)}
     */
    static LOADER_OPTIMIZATION_MASK => 6

    /**
     * Native name: STARTUP_LOADER_OPTIMIZATION_SINGLE_DOMAIN
     * @type {Integer (Int32)}
     */
    static LOADER_OPTIMIZATION_SINGLE_DOMAIN => 2

    /**
     * Native name: STARTUP_LOADER_OPTIMIZATION_MULTI_DOMAIN
     * @type {Integer (Int32)}
     */
    static LOADER_OPTIMIZATION_MULTI_DOMAIN => 4

    /**
     * Native name: STARTUP_LOADER_OPTIMIZATION_MULTI_DOMAIN_HOST
     * @type {Integer (Int32)}
     */
    static LOADER_OPTIMIZATION_MULTI_DOMAIN_HOST => 6

    /**
     * Native name: STARTUP_LOADER_SAFEMODE
     * @type {Integer (Int32)}
     */
    static LOADER_SAFEMODE => 16

    /**
     * Native name: STARTUP_LOADER_SETPREFERENCE
     * @type {Integer (Int32)}
     */
    static LOADER_SETPREFERENCE => 256

    /**
     * Native name: STARTUP_SERVER_GC
     * @type {Integer (Int32)}
     */
    static SERVER_GC => 4096

    /**
     * Native name: STARTUP_HOARD_GC_VM
     * @type {Integer (Int32)}
     */
    static HOARD_GC_VM => 8192

    /**
     * Native name: STARTUP_SINGLE_VERSION_HOSTING_INTERFACE
     * @type {Integer (Int32)}
     */
    static SINGLE_VERSION_HOSTING_INTERFACE => 16384

    /**
     * Native name: STARTUP_LEGACY_IMPERSONATION
     * @type {Integer (Int32)}
     */
    static LEGACY_IMPERSONATION => 65536

    /**
     * Native name: STARTUP_DISABLE_COMMITTHREADSTACK
     * @type {Integer (Int32)}
     */
    static DISABLE_COMMITTHREADSTACK => 131072

    /**
     * Native name: STARTUP_ALWAYSFLOW_IMPERSONATION
     * @type {Integer (Int32)}
     */
    static ALWAYSFLOW_IMPERSONATION => 262144

    /**
     * Native name: STARTUP_TRIM_GC_COMMIT
     * @type {Integer (Int32)}
     */
    static TRIM_GC_COMMIT => 524288

    /**
     * Native name: STARTUP_ETW
     * @type {Integer (Int32)}
     */
    static ETW => 1048576

    /**
     * Native name: STARTUP_ARM
     * @type {Integer (Int32)}
     */
    static ARM => 4194304
}
