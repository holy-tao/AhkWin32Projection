#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class SymbolSearchOptions extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SymbolSearchNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static SymbolSearchCompletion => 1

    /**
     * @type {Integer (Int32)}
     */
    static SymbolSearchCaseInsensitive => 2
}
