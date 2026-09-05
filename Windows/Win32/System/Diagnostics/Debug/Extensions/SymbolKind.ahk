#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
class SymbolKind extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static Symbol => 0

    /**
     * Native name: SymbolModule
     * @type {Integer (Int32)}
     */
    static Module => 1

    /**
     * Native name: SymbolType
     * @type {Integer (Int32)}
     */
    static Type => 2

    /**
     * Native name: SymbolField
     * @type {Integer (Int32)}
     */
    static Field => 3

    /**
     * Native name: SymbolConstant
     * @type {Integer (Int32)}
     */
    static Constant => 4

    /**
     * Native name: SymbolData
     * @type {Integer (Int32)}
     */
    static Data => 5

    /**
     * Native name: SymbolBaseClass
     * @type {Integer (Int32)}
     */
    static BaseClass => 6

    /**
     * Native name: SymbolPublic
     * @type {Integer (Int32)}
     */
    static Public => 7

    /**
     * Native name: SymbolFunction
     * @type {Integer (Int32)}
     */
    static Function => 8
}
