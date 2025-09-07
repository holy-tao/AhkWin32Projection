#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class CorExceptionFlag{

    /**
     * @type {Integer (Int32)}
     */
    static COR_ILEXCEPTION_CLAUSE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static COR_ILEXCEPTION_CLAUSE_OFFSETLEN => 0

    /**
     * @type {Integer (Int32)}
     */
    static COR_ILEXCEPTION_CLAUSE_DEPRECATED => 0

    /**
     * @type {Integer (Int32)}
     */
    static COR_ILEXCEPTION_CLAUSE_FILTER => 1

    /**
     * @type {Integer (Int32)}
     */
    static COR_ILEXCEPTION_CLAUSE_FINALLY => 2

    /**
     * @type {Integer (Int32)}
     */
    static COR_ILEXCEPTION_CLAUSE_FAULT => 4

    /**
     * @type {Integer (Int32)}
     */
    static COR_ILEXCEPTION_CLAUSE_DUPLICATED => 8
}
