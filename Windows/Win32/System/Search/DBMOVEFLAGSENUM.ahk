#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DBMOVEFLAGSENUM extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DBMOVE_REPLACE_EXISTING => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBMOVE_ASYNC => 256

    /**
     * @type {Integer (Int32)}
     */
    static DBMOVE_DONT_UPDATE_LINKS => 512

    /**
     * @type {Integer (Int32)}
     */
    static DBMOVE_ALLOW_EMULATION => 1024

    /**
     * @type {Integer (Int32)}
     */
    static DBMOVE_ATOMIC => 4096
}
