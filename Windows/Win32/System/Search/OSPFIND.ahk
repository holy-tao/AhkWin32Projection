#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 */
class OSPFIND extends Win32Enum {

    /**
     * Native name: OSPFIND_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * Native name: OSPFIND_UP
     * @type {Integer (Int32)}
     */
    static UP => 1

    /**
     * Native name: OSPFIND_CASESENSITIVE
     * @type {Integer (Int32)}
     */
    static CASESENSITIVE => 2

    /**
     * Native name: OSPFIND_UPCASESENSITIVE
     * @type {Integer (Int32)}
     */
    static UPCASESENSITIVE => 3
}
