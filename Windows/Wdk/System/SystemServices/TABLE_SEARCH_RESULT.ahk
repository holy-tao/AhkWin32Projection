#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class TABLE_SEARCH_RESULT extends Win32Enum {

    /**
     * Native name: TableEmptyTree
     * @type {Integer (Int32)}
     */
    static EmptyTree => 0

    /**
     * Native name: TableFoundNode
     * @type {Integer (Int32)}
     */
    static FoundNode => 1

    /**
     * Native name: TableInsertAsLeft
     * @type {Integer (Int32)}
     */
    static InsertAsLeft => 2

    /**
     * Native name: TableInsertAsRight
     * @type {Integer (Int32)}
     */
    static InsertAsRight => 3
}
