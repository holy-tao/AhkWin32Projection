#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DBPOSITIONFLAGSENUM extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DBPOSITION_OK => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBPOSITION_NOROW => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBPOSITION_BOF => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBPOSITION_EOF => 3
}
