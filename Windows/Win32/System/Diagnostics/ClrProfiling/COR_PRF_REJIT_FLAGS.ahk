#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
class COR_PRF_REJIT_FLAGS extends Win32Enum {

    /**
     * Native name: COR_PRF_REJIT_BLOCK_INLINING
     * @type {Integer (Int32)}
     */
    static BLOCK_INLINING => 1

    /**
     * Native name: COR_PRF_REJIT_INLINING_CALLBACKS
     * @type {Integer (Int32)}
     */
    static INLINING_CALLBACKS => 2
}
