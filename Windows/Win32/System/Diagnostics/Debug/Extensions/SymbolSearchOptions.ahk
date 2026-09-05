#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
class SymbolSearchOptions extends Win32Enum {

    /**
     * Native name: SymbolSearchNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: SymbolSearchCompletion
     * @type {Integer (Int32)}
     */
    static Completion => 1

    /**
     * Native name: SymbolSearchCaseInsensitive
     * @type {Integer (Int32)}
     */
    static CaseInsensitive => 2
}
