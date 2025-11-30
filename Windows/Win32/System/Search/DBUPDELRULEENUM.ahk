#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DBUPDELRULEENUM extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DBUPDELRULE_NOACTION => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBUPDELRULE_CASCADE => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBUPDELRULE_SETNULL => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBUPDELRULE_SETDEFAULT => 3
}
