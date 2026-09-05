#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The state of an item.
 * @remarks
 * The PRJ_FILE_STATE_FULL and PRJ_FILE_STATE_TOMBSTONE bits will not appear in combination with each other or any other bit.
 * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/ne-projectedfslib-prj_file_state
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 */
class PRJ_FILE_STATE extends Win32BitflagEnum {

    /**
     * The item is a placeholder.
     * Native name: PRJ_FILE_STATE_PLACEHOLDER
     * @type {Integer (Int32)}
     */
    static PLACEHOLDER => 1

    /**
     * The item is a hydrated placeholder, i.e., the item's content has been written to disk.
     * Native name: PRJ_FILE_STATE_HYDRATED_PLACEHOLDER
     * @type {Integer (Int32)}
     */
    static HYDRATED_PLACEHOLDER => 2

    /**
     * The placeholder item's metadata has been modified.
     * Native name: PRJ_FILE_STATE_DIRTY_PLACEHOLDER
     * @type {Integer (Int32)}
     */
    static DIRTY_PLACEHOLDER => 4

    /**
     * The item is full.
     * Native name: PRJ_FILE_STATE_FULL
     * @type {Integer (Int32)}
     */
    static FULL => 8

    /**
     * The item is a tombstone.
     * Native name: PRJ_FILE_STATE_TOMBSTONE
     * @type {Integer (Int32)}
     */
    static TOMBSTONE => 16
}
