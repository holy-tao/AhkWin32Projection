#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct STARTUP_FLAGS {
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
    static STARTUP_CONCURRENT_GC => 1

    /**
     * @type {Integer (Int32)}
     */
    static STARTUP_LOADER_OPTIMIZATION_MASK => 6

    /**
     * @type {Integer (Int32)}
     */
    static STARTUP_LOADER_OPTIMIZATION_SINGLE_DOMAIN => 2

    /**
     * @type {Integer (Int32)}
     */
    static STARTUP_LOADER_OPTIMIZATION_MULTI_DOMAIN => 4

    /**
     * @type {Integer (Int32)}
     */
    static STARTUP_LOADER_OPTIMIZATION_MULTI_DOMAIN_HOST => 6

    /**
     * @type {Integer (Int32)}
     */
    static STARTUP_LOADER_SAFEMODE => 16

    /**
     * @type {Integer (Int32)}
     */
    static STARTUP_LOADER_SETPREFERENCE => 256

    /**
     * @type {Integer (Int32)}
     */
    static STARTUP_SERVER_GC => 4096

    /**
     * @type {Integer (Int32)}
     */
    static STARTUP_HOARD_GC_VM => 8192

    /**
     * @type {Integer (Int32)}
     */
    static STARTUP_SINGLE_VERSION_HOSTING_INTERFACE => 16384

    /**
     * @type {Integer (Int32)}
     */
    static STARTUP_LEGACY_IMPERSONATION => 65536

    /**
     * @type {Integer (Int32)}
     */
    static STARTUP_DISABLE_COMMITTHREADSTACK => 131072

    /**
     * @type {Integer (Int32)}
     */
    static STARTUP_ALWAYSFLOW_IMPERSONATION => 262144

    /**
     * @type {Integer (Int32)}
     */
    static STARTUP_TRIM_GC_COMMIT => 524288

    /**
     * @type {Integer (Int32)}
     */
    static STARTUP_ETW => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static STARTUP_ARM => 4194304
}
