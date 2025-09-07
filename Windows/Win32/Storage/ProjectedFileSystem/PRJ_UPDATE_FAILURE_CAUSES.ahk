#Requires AutoHotkey v2.0.0 64-bit

/**
 * Descriptions for the reason an update failed.
 * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/ne-projectedfslib-prj_update_failure_causes
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 * @version v4.0.30319
 */
class PRJ_UPDATE_FAILURE_CAUSES{

    /**
     * The update did not fail.
     * @type {Integer (Int32)}
     */
    static PRJ_UPDATE_FAILURE_CAUSE_NONE => 0

    /**
     * The item was a dirty placeholder (hydrated or not), and the provider did not specify PRJ_UPDATE_ALLOW_DIRTY_METADATA in <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/ne-projectedfslib-prj_update_types">PRJ_UPDATE_TYPES</a>.
     * @type {Integer (Int32)}
     */
    static PRJ_UPDATE_FAILURE_CAUSE_DIRTY_METADATA => 1

    /**
     * The item was a full file and the provider did not specify PRJ_UPDATE_ALLOW_DIRTY_DATA in <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/ne-projectedfslib-prj_update_types">PRJ_UPDATE_TYPES</a>.
     * @type {Integer (Int32)}
     */
    static PRJ_UPDATE_FAILURE_CAUSE_DIRTY_DATA => 2

    /**
     * The item was a tombstone and the provider did not specify PRJ_UPDATE_ALLOW_TOMBSTONE in <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/ne-projectedfslib-prj_update_types">PRJ_UPDATE_TYPES</a>.
     * @type {Integer (Int32)}
     */
    static PRJ_UPDATE_FAILURE_CAUSE_TOMBSTONE => 4

    /**
     * The item had the DOS read-only bit set and the provider did not specify PRJ_UPDATE_ALLOW_READ_ONLY in <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/ne-projectedfslib-prj_update_types">PRJ_UPDATE_TYPES</a>.
     * @type {Integer (Int32)}
     */
    static PRJ_UPDATE_FAILURE_CAUSE_READ_ONLY => 8
}
