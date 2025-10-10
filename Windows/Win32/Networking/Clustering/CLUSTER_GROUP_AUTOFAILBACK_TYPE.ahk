#Requires AutoHotkey v2.0.0 64-bit

/**
 * Used by the AutoFailbackType group common property to specify whether the group should be failed back to the node identified as its preferred owner when that node comes back online following a failover.
 * @see https://docs.microsoft.com/windows/win32/api//msclus/ne-msclus-cluster_group_autofailback_type
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_GROUP_AUTOFAILBACK_TYPE{

    /**
     * Prevents <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/failback">failback</a>.
     * @type {Integer (Int32)}
     */
    static ClusterGroupPreventFailback => 0

    /**
     * Allows failback (requires a preferred owners list for the group).
     * @type {Integer (Int32)}
     */
    static ClusterGroupAllowFailback => 1

    /**
     * Defines a maximum group property value. It is not supported by the 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/groups-autofailbacktype">AutoFailbackType</a> group property.
     * @type {Integer (Int32)}
     */
    static ClusterGroupFailbackTypeCount => 2
}
