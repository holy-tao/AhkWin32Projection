#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the failback type to use when a cluster node in a paused state is resumed by the ResumeClusterNodeEx function.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ne-clusapi-cluster_node_resume_failback_type
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUSTER_NODE_RESUME_FAILBACK_TYPE extends Win32Enum {

    /**
     * Indicates that the failback process is  not to  be performed on the specified groups.
     * @type {Integer (Int32)}
     */
    static DoNotFailbackGroups => 0

    /**
     * Indicates that the groups is  to  be failed back to the node.
     * Native name: FailbackGroupsImmediately
     * @type {Integer (Int32)}
     */
    static GroupsImmediately => 1

    /**
     * Indicates that the failover policy for each group is to  be used.
     * Native name: FailbackGroupsPerPolicy
     * @type {Integer (Int32)}
     */
    static GroupsPerPolicy => 2

    /**
     * Defines the maximum number of failback types.
     * Native name: ClusterNodeResumeFailbackTypeCount
     * @type {Integer (Int32)}
     */
    static Count => 3
}
