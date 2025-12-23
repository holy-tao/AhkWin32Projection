#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class PAGE_OFFLINE_ERROR_TYPES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static BitErrorDdr4 => 0

    /**
     * @type {Integer (Int32)}
     */
    static RowErrorDdr4 => 1

    /**
     * @type {Integer (Int32)}
     */
    static BitErrorDdr5 => 2

    /**
     * @type {Integer (Int32)}
     */
    static RowErrorDdr5 => 3
}
