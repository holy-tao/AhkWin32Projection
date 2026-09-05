#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
class COR_PRF_JIT_CACHE extends Win32Enum {

    /**
     * Native name: COR_PRF_CACHED_FUNCTION_FOUND
     * @type {Integer (Int32)}
     */
    static CACHED_FUNCTION_FOUND => 0

    /**
     * Native name: COR_PRF_CACHED_FUNCTION_NOT_FOUND
     * @type {Integer (Int32)}
     */
    static CACHED_FUNCTION_NOT_FOUND => 1
}
