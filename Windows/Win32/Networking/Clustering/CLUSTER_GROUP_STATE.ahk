#Requires AutoHotkey v2.0.0 64-bit

/**
 * Enumerates the possible states of a group.
 * @see https://docs.microsoft.com/windows/win32/api//msclus/ne-msclus-cluster_group_state
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_GROUP_STATE{

    /**
     * The state of the group is unknown.
     * @type {Integer (Int32)}
     */
    static ClusterGroupStateUnknown => -1

    /**
     * All of the resources in the group are <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/o-gly">online</a>.
     * @type {Integer (Int32)}
     */
    static ClusterGroupOnline => 0

    /**
     * All of the resources in the group are <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/o-gly">offline</a> or 
 *       there are no resources in the group.
     * @type {Integer (Int32)}
     */
    static ClusterGroupOffline => 1

    /**
     * At least one <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resources">resource</a> in the group has failed.
     * @type {Integer (Int32)}
     */
    static ClusterGroupFailed => 2

    /**
     * At least one resource in the group is online. No resources are 
 *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/p-gly">pending</a> or 
 *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/f-gly">failed</a>.
     * @type {Integer (Int32)}
     */
    static ClusterGroupPartialOnline => 3

    /**
     * At least one resource in the group is in a pending state. There are no failed resources.
     * @type {Integer (Int32)}
     */
    static ClusterGroupPending => 4
}
