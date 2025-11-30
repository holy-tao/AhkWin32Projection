#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class COR_PRF_GC_ROOT_KIND extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_GC_ROOT_STACK => 1

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_GC_ROOT_FINALIZER => 2

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_GC_ROOT_HANDLE => 3

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_GC_ROOT_OTHER => 0
}
