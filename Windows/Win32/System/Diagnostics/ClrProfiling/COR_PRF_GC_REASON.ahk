#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
class COR_PRF_GC_REASON extends Win32Enum {

    /**
     * Native name: COR_PRF_GC_INDUCED
     * @type {Integer (Int32)}
     */
    static INDUCED => 1

    /**
     * Native name: COR_PRF_GC_OTHER
     * @type {Integer (Int32)}
     */
    static OTHER => 0
}
