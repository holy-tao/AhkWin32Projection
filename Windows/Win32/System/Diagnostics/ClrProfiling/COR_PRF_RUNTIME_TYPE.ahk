#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
class COR_PRF_RUNTIME_TYPE extends Win32Enum {

    /**
     * Native name: COR_PRF_DESKTOP_CLR
     * @type {Integer (Int32)}
     */
    static DESKTOP_CLR => 1

    /**
     * Native name: COR_PRF_CORE_CLR
     * @type {Integer (Int32)}
     */
    static CORE_CLR => 2
}
