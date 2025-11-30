#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class REFS_STREAM_SNAPSHOT_OPERATION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static REFS_STREAM_SNAPSHOT_OPERATION_INVALID => 0

    /**
     * @type {Integer (Int32)}
     */
    static REFS_STREAM_SNAPSHOT_OPERATION_CREATE => 1

    /**
     * @type {Integer (Int32)}
     */
    static REFS_STREAM_SNAPSHOT_OPERATION_LIST => 2

    /**
     * @type {Integer (Int32)}
     */
    static REFS_STREAM_SNAPSHOT_OPERATION_QUERY_DELTAS => 3

    /**
     * @type {Integer (Int32)}
     */
    static REFS_STREAM_SNAPSHOT_OPERATION_REVERT => 4

    /**
     * @type {Integer (Int32)}
     */
    static REFS_STREAM_SNAPSHOT_OPERATION_SET_SHADOW_BTREE => 5

    /**
     * @type {Integer (Int32)}
     */
    static REFS_STREAM_SNAPSHOT_OPERATION_CLEAR_SHADOW_BTREE => 6

    /**
     * @type {Integer (Int32)}
     */
    static REFS_STREAM_SNAPSHOT_OPERATION_MAX => 6
}
