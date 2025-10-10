#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the priority class and rank of a specific DFS target.
 * @remarks
 * 
  * This structure is used as the <b>TargetPriority</b> member of the 
  *     <a href="https://docs.microsoft.com/windows/desktop/api/lmdfs/ns-lmdfs-dfs_info_104">DFS_INFO_104</a>, 
  *     <a href="https://docs.microsoft.com/windows/desktop/api/lmdfs/ns-lmdfs-dfs_info_106">DFS_INFO_106</a>, and 
  *     <a href="https://docs.microsoft.com/windows/desktop/api/lmdfs/ns-lmdfs-dfs_storage_info_1">DFS_STORAGE_INFO_1</a> structures. There are no functions 
  *     that use this structure directly.
  * 
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
  *     normal priority class is then subdivided, based on Active Directory site cost, into site-cost high priority, 
  *     site-cost normal priority, and site-cost low priority classes.
  * 
  * For example, all of the server targets with a site-cost value of 0 are first grouped into site-cost high, 
  *     normal, and low priority classes. Then, all server targets with higher site costs are likewise separated into 
  *     site-cost high, normal, and low priority classes. Thus, a server target with a site-cost value of 0 and a 
  *     site-cost low priority class is still ranked higher than a server target with a site-cost value of 1 and site-cost 
  *     high priority class.
  * 
  * Note that the value for a "normal priority class" is set to 0 even though it is lower in priority than 
  *     <b>DfsGlobalHighPriorityClass</b> and <b>DfsSiteCostHighPriorityClass</b>. This is the default 
  *     setting for priority class.  Priority rank can be used to discriminate within a priority class for added 
  *     granularity.
  * 
  * For more information about how server target priority is determined, see 
  *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dfs/dfs-server-target-prioritization">DFS Server Target Prioritization</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//lmdfs/ns-lmdfs-dfs_target_priority
 * @namespace Windows.Win32.Storage.DistributedFileSystem
 * @version v4.0.30319
 */
class DFS_TARGET_PRIORITY extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * <a href="https://docs.microsoft.com/windows/win32/api/lmdfs/ne-lmdfs-dfs_target_priority_class~r1">DFS_TARGET_PRIORITY_CLASS</a> enumeration 
     *       value that specifies the priority class of the target.
     * @type {Integer}
     */
    TargetPriorityClass {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Specifies the priority rank value of the target. The default value is 0, which indicates the highest 
     *       priority rank within a priority class.
     * @type {Integer}
     */
    TargetPriorityRank {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * This member is reserved and must be zero.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }
}
