#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class COR_PRF_HANDLE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_HANDLE_TYPE_WEAK => 1

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_HANDLE_TYPE_STRONG => 2

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_HANDLE_TYPE_PINNED => 3
}
