#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
class COR_PRF_GC_GENERATION extends Win32Enum {

    /**
     * Native name: COR_PRF_GC_GEN_0
     * @type {Integer (Int32)}
     */
    static GEN_0 => 0

    /**
     * Native name: COR_PRF_GC_GEN_1
     * @type {Integer (Int32)}
     */
    static GEN_1 => 1

    /**
     * Native name: COR_PRF_GC_GEN_2
     * @type {Integer (Int32)}
     */
    static GEN_2 => 2

    /**
     * Native name: COR_PRF_GC_LARGE_OBJECT_HEAP
     * @type {Integer (Int32)}
     */
    static LARGE_OBJECT_HEAP => 3

    /**
     * Native name: COR_PRF_GC_PINNED_OBJECT_HEAP
     * @type {Integer (Int32)}
     */
    static PINNED_OBJECT_HEAP => 4
}
