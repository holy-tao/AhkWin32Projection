#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DBWATCHMODEENUM extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DBWATCHMODE_ALL => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBWATCHMODE_EXTEND => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBWATCHMODE_MOVE => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBWATCHMODE_COUNT => 8
}
