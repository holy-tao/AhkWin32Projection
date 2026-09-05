#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
class COR_PRF_GC_ROOT_KIND extends Win32Enum {

    /**
     * Native name: COR_PRF_GC_ROOT_STACK
     * @type {Integer (Int32)}
     */
    static STACK => 1

    /**
     * Native name: COR_PRF_GC_ROOT_FINALIZER
     * @type {Integer (Int32)}
     */
    static FINALIZER => 2

    /**
     * Native name: COR_PRF_GC_ROOT_HANDLE
     * @type {Integer (Int32)}
     */
    static HANDLE => 3

    /**
     * Native name: COR_PRF_GC_ROOT_OTHER
     * @type {Integer (Int32)}
     */
    static OTHER => 0
}
