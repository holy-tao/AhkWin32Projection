#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 */
class DBCOMMANDPERSISTFLAGENUM21 extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static DBCOMMANDPERSISTFLAG_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBCOMMANDPERSISTFLAG_PERSISTVIEW => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBCOMMANDPERSISTFLAG_PERSISTPROCEDURE => 4
}
