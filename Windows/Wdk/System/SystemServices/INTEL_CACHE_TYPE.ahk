#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class INTEL_CACHE_TYPE extends Win32Enum {

    /**
     * Native name: IntelCacheNull
     * @type {Integer (Int32)}
     */
    static Null => 0

    /**
     * Native name: IntelCacheData
     * @type {Integer (Int32)}
     */
    static Data => 1

    /**
     * Native name: IntelCacheInstruction
     * @type {Integer (Int32)}
     */
    static Instruction => 2

    /**
     * Native name: IntelCacheUnified
     * @type {Integer (Int32)}
     */
    static Unified => 3

    /**
     * Native name: IntelCacheRam
     * @type {Integer (Int32)}
     */
    static Ram => 4

    /**
     * Native name: IntelCacheTrace
     * @type {Integer (Int32)}
     */
    static Trace => 5
}
