#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
class SYM_TYPE extends Win32Enum {

    /**
     * Native name: SymNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: SymCoff
     * @type {Integer (Int32)}
     */
    static Coff => 1

    /**
     * Native name: SymCv
     * @type {Integer (Int32)}
     */
    static Cv => 2

    /**
     * Native name: SymPdb
     * @type {Integer (Int32)}
     */
    static Pdb => 3

    /**
     * Native name: SymExport
     * @type {Integer (Int32)}
     */
    static Export => 4

    /**
     * Native name: SymDeferred
     * @type {Integer (Int32)}
     */
    static Deferred => 5

    /**
     * Native name: SymSym
     * @type {Integer (Int32)}
     */
    static Sym => 6

    /**
     * Native name: SymDia
     * @type {Integer (Int32)}
     */
    static Dia => 7

    /**
     * Native name: SymVirtual
     * @type {Integer (Int32)}
     */
    static Virtual => 8

    /**
     * @type {Integer (Int32)}
     */
    static NumSymTypes => 9
}
