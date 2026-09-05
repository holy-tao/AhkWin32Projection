#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
class COR_PRF_GC_ROOT_FLAGS extends Win32Enum {

    /**
     * Native name: COR_PRF_GC_ROOT_PINNING
     * @type {Integer (Int32)}
     */
    static PINNING => 1

    /**
     * Native name: COR_PRF_GC_ROOT_WEAKREF
     * @type {Integer (Int32)}
     */
    static WEAKREF => 2

    /**
     * Native name: COR_PRF_GC_ROOT_INTERIOR
     * @type {Integer (Int32)}
     */
    static INTERIOR => 4

    /**
     * Native name: COR_PRF_GC_ROOT_REFCOUNTED
     * @type {Integer (Int32)}
     */
    static REFCOUNTED => 8
}
