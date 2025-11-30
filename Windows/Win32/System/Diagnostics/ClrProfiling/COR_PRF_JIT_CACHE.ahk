#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class COR_PRF_JIT_CACHE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_CACHED_FUNCTION_FOUND => 0

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_CACHED_FUNCTION_NOT_FOUND => 1
}
