#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the failback type to use when a cluster node in a paused state is resumed by the ResumeClusterNodeEx function.
 * @see https://docs.microsoft.com/windows/win32/api//clusapi/ne-clusapi-cluster_node_resume_failback_type
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_NODE_RESUME_FAILBACK_TYPE extends Win32Enum{

    /**
     * Indicates that the failback process is  not to  be performed on the specified groups.
     * @type {Integer (Int32)}
     */
    static DoNotFailbackGroups => 0

    /**
     * Indicates that the groups is  to  be failed back to the node.
     * @type {Integer (Int32)}
     */
    static FailbackGroupsImmediately => 1

    /**
     * Indicates that the failover policy for each group is to  be used.
     * @type {Integer (Int32)}
     */
    static FailbackGroupsPerPolicy => 2

    /**
     * Defines the maximum number of failback types.
     * @type {Integer (Int32)}
     */
    static ClusterNodeResumeFailbackTypeCount => 3
}
