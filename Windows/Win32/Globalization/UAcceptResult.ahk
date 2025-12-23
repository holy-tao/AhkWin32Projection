#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UAcceptResult extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ULOC_ACCEPT_FAILED => 0

    /**
     * @type {Integer (Int32)}
     */
    static ULOC_ACCEPT_VALID => 1

    /**
     * @type {Integer (Int32)}
     */
    static ULOC_ACCEPT_FALLBACK => 2
}
