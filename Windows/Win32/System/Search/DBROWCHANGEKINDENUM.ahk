#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 */
class DBROWCHANGEKINDENUM extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static DBROWCHANGEKIND_INSERT => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBROWCHANGEKIND_DELETE => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBROWCHANGEKIND_UPDATE => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBROWCHANGEKIND_COUNT => 3
}
