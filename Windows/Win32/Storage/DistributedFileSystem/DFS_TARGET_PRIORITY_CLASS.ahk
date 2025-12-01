#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DFS_TARGET_PRIORITY_CLASS enumeration r1 (lmdfs.h) defines the set of possible DFS target priority class settings.
 * @remarks
 * The order of priority classes from highest to lowest is as follows:
 * 
 * <ul>
 * <li><b>DfsGlobalHighPriorityClass</b></li>
 * <li><b>DfsSiteCostHighPriorityClass</b></li>
 * <li><b>DfsSiteCostNormalPriorityClass</b></li>
 * <li><b>DfsSiteCostLowPriorityClass</b></li>
 * <li><b>DfsGlobalLowPriorityClass</b></li>
 * </ul>
 * Server targets are initially grouped into global high priority, normal priority, and low priority classes. The 
 *      normal priority class is then subdivided, based on Active Directory site cost, into site-cost high priority, 
 *      site-cost normal priority, and site-cost low priority classes.
 * 
 * For example, all of the server targets with a site-cost value of 0 are first grouped into site-cost high, 
 *      normal, and low priority classes. Then, all server targets with lower site costs are likewise separated into 
 *      site-cost high, normal, and low priority classes. Thus, a server target with a site-cost value of 0 and a 
 *      site-cost low priority class is still ranked higher than a server target with a site-cost value of 1 and 
 *      site-cost high priority class.
 * 
 * For more information about how server target priority is determined, see 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dfs/dfs-server-target-prioritization">DFS Server Target Prioritization</a>.
 * @see https://learn.microsoft.com/windows/win32/api/lmdfs/ne-lmdfs-dfs_target_priority_class~r1
 * @namespace Windows.Win32.Storage.DistributedFileSystem
 * @version v4.0.30319
 */
class DFS_TARGET_PRIORITY_CLASS extends Win32Enum{

    /**
     * The priority class is not valid.
     * @type {Integer (Int32)}
     */
    static DfsInvalidPriorityClass => -1

    /**
     * The middle or "normal" site cost priority class for a DFS target.
     * @type {Integer (Int32)}
     */
    static DfsSiteCostNormalPriorityClass => 0

    /**
     * The highest priority class for a DFS target. Targets assigned this class receive global preference.
     * @type {Integer (Int32)}
     */
    static DfsGlobalHighPriorityClass => 1

    /**
     * The highest site cost priority class for a DFS target. Targets assigned this class receive the most preference among targets of the same site cost for a given DFS client.
     * @type {Integer (Int32)}
     */
    static DfsSiteCostHighPriorityClass => 2

    /**
     * The lowest site cost priority class for a DFS target. Targets assigned this class receive the least preference among targets of the same site cost for a given DFS client.
     * @type {Integer (Int32)}
     */
    static DfsSiteCostLowPriorityClass => 3

    /**
     * The lowest level of priority class for a DFS target. Targets assigned this class receive the least preference globally.
     * @type {Integer (Int32)}
     */
    static DfsGlobalLowPriorityClass => 4
}
