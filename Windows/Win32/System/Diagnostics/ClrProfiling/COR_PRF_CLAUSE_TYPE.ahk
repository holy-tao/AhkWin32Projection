#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
class COR_PRF_CLAUSE_TYPE extends Win32Enum {

    /**
     * Native name: COR_PRF_CLAUSE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: COR_PRF_CLAUSE_FILTER
     * @type {Integer (Int32)}
     */
    static FILTER => 1

    /**
     * Native name: COR_PRF_CLAUSE_CATCH
     * @type {Integer (Int32)}
     */
    static CATCH => 2

    /**
     * Native name: COR_PRF_CLAUSE_FINALLY
     * @type {Integer (Int32)}
     */
    static FINALLY => 3
}
