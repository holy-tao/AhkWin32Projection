#Requires AutoHotkey v2.0.0 64-bit

/**
 * Used by the RestartAction resource common property to specify the action to be taken by the cluster service if the resource fails.
 * @see https://docs.microsoft.com/windows/win32/api//msclus/ne-msclus-cluster_resource_restart_action
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_RESOURCE_RESTART_ACTION{

    /**
     * Do not restart the resource after a failure.
     * @type {Integer (Int32)}
     */
    static ClusterResourceDontRestart => 0

    /**
     * Restart the resource after a failure. If the resource exceeds its restart threshold within its restart 
     *        period, do not attempt to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/failover">failover</a> the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/groups">group</a> to another 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/nodes">node</a> in the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/c-gly">cluster</a>.
     * @type {Integer (Int32)}
     */
    static ClusterResourceRestartNoNotify => 1

    /**
     * Restart the resource after a failure. If the resource exceeds its restart threshold within its restart 
     *        period, attempt to fail over the group to another node in the cluster. This is the default setting.
     * @type {Integer (Int32)}
     */
    static ClusterResourceRestartNotify => 2

    /**
     * Defines the maximum value of the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ne-clusapi-cluster_resource_restart_action">CLUSTER_RESOURCE_RESTART_ACTION</a> enumeration.  It is not a valid value for the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resources-restartaction">RestartAction</a> property.
     * @type {Integer (Int32)}
     */
    static ClusterResourceRestartActionCount => 3
}
