#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Storage.DistributedFileSystem
 * @version v4.0.30319
 */
class DFS_TARGET_PRIORITY_CLASS{

    /**
     * @type {Integer (Int32)}
     */
    static DfsInvalidPriorityClass => -1

    /**
     * @type {Integer (Int32)}
     */
    static DfsSiteCostNormalPriorityClass => 0

    /**
     * @type {Integer (Int32)}
     */
    static DfsGlobalHighPriorityClass => 1

    /**
     * @type {Integer (Int32)}
     */
    static DfsSiteCostHighPriorityClass => 2

    /**
     * @type {Integer (Int32)}
     */
    static DfsSiteCostLowPriorityClass => 3

    /**
     * @type {Integer (Int32)}
     */
    static DfsGlobalLowPriorityClass => 4
}
