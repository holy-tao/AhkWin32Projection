#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 */
class OSPFIND extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static OSPFIND_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static OSPFIND_UP => 1

    /**
     * @type {Integer (Int32)}
     */
    static OSPFIND_CASESENSITIVE => 2

    /**
     * @type {Integer (Int32)}
     */
    static OSPFIND_UPCASESENSITIVE => 3
}
