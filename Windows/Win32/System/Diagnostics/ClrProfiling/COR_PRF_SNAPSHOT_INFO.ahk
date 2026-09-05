#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
class COR_PRF_SNAPSHOT_INFO extends Win32Enum {

    /**
     * Native name: COR_PRF_SNAPSHOT_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * Native name: COR_PRF_SNAPSHOT_REGISTER_CONTEXT
     * @type {Integer (Int32)}
     */
    static REGISTER_CONTEXT => 1

    /**
     * Native name: COR_PRF_SNAPSHOT_X86_OPTIMIZED
     * @type {Integer (Int32)}
     */
    static X86_OPTIMIZED => 2
}
