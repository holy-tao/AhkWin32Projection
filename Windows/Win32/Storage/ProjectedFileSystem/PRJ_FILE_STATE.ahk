#Requires AutoHotkey v2.0.0 64-bit

/**
 * The state of an item.
 * @remarks
 * The PRJ_FILE_STATE_FULL and PRJ_FILE_STATE_TOMBSTONE bits will not appear in combination with each other or any other bit.
 * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/ne-projectedfslib-prj_file_state
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 * @version v4.0.30319
 */
class PRJ_FILE_STATE{

    /**
     * The item is a placeholder.
     * @type {Integer (Int32)}
     */
    static PRJ_FILE_STATE_PLACEHOLDER => 1

    /**
     * The item is a hydrated placeholder, i.e., the item's content has been written to disk.
     * @type {Integer (Int32)}
     */
    static PRJ_FILE_STATE_HYDRATED_PLACEHOLDER => 2

    /**
     * The placeholder item's metadata has been modified.
     * @type {Integer (Int32)}
     */
    static PRJ_FILE_STATE_DIRTY_PLACEHOLDER => 4

    /**
     * The item is full.
     * @type {Integer (Int32)}
     */
    static PRJ_FILE_STATE_FULL => 8

    /**
     * The item is a tombstone.
     * @type {Integer (Int32)}
     */
    static PRJ_FILE_STATE_TOMBSTONE => 16
}
