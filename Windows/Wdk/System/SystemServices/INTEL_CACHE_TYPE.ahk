#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class INTEL_CACHE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static IntelCacheNull => 0

    /**
     * @type {Integer (Int32)}
     */
    static IntelCacheData => 1

    /**
     * @type {Integer (Int32)}
     */
    static IntelCacheInstruction => 2

    /**
     * @type {Integer (Int32)}
     */
    static IntelCacheUnified => 3

    /**
     * @type {Integer (Int32)}
     */
    static IntelCacheRam => 4

    /**
     * @type {Integer (Int32)}
     */
    static IntelCacheTrace => 5
}
