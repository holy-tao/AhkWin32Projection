#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class REFS_STREAM_SNAPSHOT_OPERATION extends Win32Enum {

    /**
     * Native name: REFS_STREAM_SNAPSHOT_OPERATION_INVALID
     * @type {Integer (Int32)}
     */
    static INVALID => 0

    /**
     * Native name: REFS_STREAM_SNAPSHOT_OPERATION_CREATE
     * @type {Integer (Int32)}
     */
    static CREATE => 1

    /**
     * Native name: REFS_STREAM_SNAPSHOT_OPERATION_LIST
     * @type {Integer (Int32)}
     */
    static LIST => 2

    /**
     * Native name: REFS_STREAM_SNAPSHOT_OPERATION_QUERY_DELTAS
     * @type {Integer (Int32)}
     */
    static QUERY_DELTAS => 3

    /**
     * Native name: REFS_STREAM_SNAPSHOT_OPERATION_REVERT
     * @type {Integer (Int32)}
     */
    static REVERT => 4

    /**
     * Native name: REFS_STREAM_SNAPSHOT_OPERATION_SET_SHADOW_BTREE
     * @type {Integer (Int32)}
     */
    static SET_SHADOW_BTREE => 5

    /**
     * Native name: REFS_STREAM_SNAPSHOT_OPERATION_CLEAR_SHADOW_BTREE
     * @type {Integer (Int32)}
     */
    static CLEAR_SHADOW_BTREE => 6

    /**
     * Native name: REFS_STREAM_SNAPSHOT_OPERATION_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 6
}
