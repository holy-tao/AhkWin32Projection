#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
class CorExceptionFlag extends Win32Enum {

    /**
     * Native name: COR_ILEXCEPTION_CLAUSE_NONE
     * @type {Integer (Int32)}
     */
    static ILEXCEPTION_CLAUSE_NONE => 0

    /**
     * Native name: COR_ILEXCEPTION_CLAUSE_OFFSETLEN
     * @type {Integer (Int32)}
     */
    static ILEXCEPTION_CLAUSE_OFFSETLEN => 0

    /**
     * Native name: COR_ILEXCEPTION_CLAUSE_DEPRECATED
     * @type {Integer (Int32)}
     */
    static ILEXCEPTION_CLAUSE_DEPRECATED => 0

    /**
     * Native name: COR_ILEXCEPTION_CLAUSE_FILTER
     * @type {Integer (Int32)}
     */
    static ILEXCEPTION_CLAUSE_FILTER => 1

    /**
     * Native name: COR_ILEXCEPTION_CLAUSE_FINALLY
     * @type {Integer (Int32)}
     */
    static ILEXCEPTION_CLAUSE_FINALLY => 2

    /**
     * Native name: COR_ILEXCEPTION_CLAUSE_FAULT
     * @type {Integer (Int32)}
     */
    static ILEXCEPTION_CLAUSE_FAULT => 4

    /**
     * Native name: COR_ILEXCEPTION_CLAUSE_DUPLICATED
     * @type {Integer (Int32)}
     */
    static ILEXCEPTION_CLAUSE_DUPLICATED => 8
}
