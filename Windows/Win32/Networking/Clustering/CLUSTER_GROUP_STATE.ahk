#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The CLUSTER_GROUP_STATE enumeration (msclus.h) enumerates the possible states of a group.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-cluster_group_state
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUSTER_GROUP_STATE extends Win32Enum {

    /**
     * The state of the group is unknown.
     * Native name: ClusterGroupStateUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => -1

    /**
     * All of the resources in the group are <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/o-gly">online</a>.
     * Native name: ClusterGroupOnline
     * @type {Integer (Int32)}
     */
    static Online => 0

    /**
     * All of the resources in the group are <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/o-gly">offline</a> or 
     *       there are no resources in the group.
     * Native name: ClusterGroupOffline
     * @type {Integer (Int32)}
     */
    static Offline => 1

    /**
     * At least one <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resources">resource</a> in the group has failed.
     * Native name: ClusterGroupFailed
     * @type {Integer (Int32)}
     */
    static Failed => 2

    /**
     * At least one resource in the group is online. No resources are 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/p-gly">pending</a> or 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/f-gly">failed</a>.
     * Native name: ClusterGroupPartialOnline
     * @type {Integer (Int32)}
     */
    static PartialOnline => 3

    /**
     * At least one resource in the group is in a pending state. There are no failed resources.
     * Native name: ClusterGroupPending
     * @type {Integer (Int32)}
     */
    static Pending => 4
}
