#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents the type of processor cache identified in the corresponding CACHE_DESCRIPTOR structure.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ne-winnt-processor_cache_type
 * @namespace Windows.Win32.System.SystemInformation
 */
export default struct PROCESSOR_CACHE_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The cache is unified.
     * @type {Integer (Int32)}
     */
    static CacheUnified => 0

    /**
     * The cache is for processor instructions.
     * @type {Integer (Int32)}
     */
    static CacheInstruction => 1

    /**
     * The cache is for data.
     * @type {Integer (Int32)}
     */
    static CacheData => 2

    /**
     * The cache is for traces.
     * @type {Integer (Int32)}
     */
    static CacheTrace => 3

    /**
     * @type {Integer (Int32)}
     */
    static CacheUnknown => 4
}
