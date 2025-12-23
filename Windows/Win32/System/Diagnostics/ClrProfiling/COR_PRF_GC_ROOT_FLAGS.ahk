#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class COR_PRF_GC_ROOT_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_GC_ROOT_PINNING => 1

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_GC_ROOT_WEAKREF => 2

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_GC_ROOT_INTERIOR => 4

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_GC_ROOT_REFCOUNTED => 8
}
