#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Represents the type of processor cache identified in the corresponding CACHE_DESCRIPTOR structure.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ne-winnt-processor_cache_type
 * @namespace Windows.Win32.System.SystemInformation
 */
class PROCESSOR_CACHE_TYPE extends Win32Enum {

    /**
     * The cache is unified.
     * Native name: CacheUnified
     * @type {Integer (Int32)}
     */
    static Unified => 0

    /**
     * The cache is for processor instructions.
     * Native name: CacheInstruction
     * @type {Integer (Int32)}
     */
    static Instruction => 1

    /**
     * The cache is for data.
     * Native name: CacheData
     * @type {Integer (Int32)}
     */
    static Data => 2

    /**
     * The cache is for traces.
     * Native name: CacheTrace
     * @type {Integer (Int32)}
     */
    static Trace => 3

    /**
     * Native name: CacheUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 4
}
