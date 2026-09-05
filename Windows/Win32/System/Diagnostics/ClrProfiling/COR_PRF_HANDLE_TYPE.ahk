#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
class COR_PRF_HANDLE_TYPE extends Win32Enum {

    /**
     * Native name: COR_PRF_HANDLE_TYPE_WEAK
     * @type {Integer (Int32)}
     */
    static WEAK => 1

    /**
     * Native name: COR_PRF_HANDLE_TYPE_STRONG
     * @type {Integer (Int32)}
     */
    static STRONG => 2

    /**
     * Native name: COR_PRF_HANDLE_TYPE_PINNED
     * @type {Integer (Int32)}
     */
    static PINNED => 3
}
