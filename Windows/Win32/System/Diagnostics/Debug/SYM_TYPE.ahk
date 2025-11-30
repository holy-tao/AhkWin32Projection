#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class SYM_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SymNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static SymCoff => 1

    /**
     * @type {Integer (Int32)}
     */
    static SymCv => 2

    /**
     * @type {Integer (Int32)}
     */
    static SymPdb => 3

    /**
     * @type {Integer (Int32)}
     */
    static SymExport => 4

    /**
     * @type {Integer (Int32)}
     */
    static SymDeferred => 5

    /**
     * @type {Integer (Int32)}
     */
    static SymSym => 6

    /**
     * @type {Integer (Int32)}
     */
    static SymDia => 7

    /**
     * @type {Integer (Int32)}
     */
    static SymVirtual => 8

    /**
     * @type {Integer (Int32)}
     */
    static NumSymTypes => 9
}
