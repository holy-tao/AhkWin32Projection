#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct REFS_STREAM_SNAPSHOT_OPERATION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
