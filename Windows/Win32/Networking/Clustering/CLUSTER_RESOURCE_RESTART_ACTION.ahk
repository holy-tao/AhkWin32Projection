#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * CLUSTER_RESOURCE_RESTART_ACTION (msclus.h) is used by the RestartAction resource common property to specify the cluster service's action if the resource fails.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-cluster_resource_restart_action
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUSTER_RESOURCE_RESTART_ACTION extends Win32Enum {

    /**
     * Do not restart the resource after a failure.
     * Native name: ClusterResourceDontRestart
     * @type {Integer (Int32)}
     */
    static DontRestart => 0

    /**
     * Restart the resource after a failure. If the resource exceeds its restart threshold within its restart 
     *        period, do not attempt to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/failover">failover</a> the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/groups">group</a> to another 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/nodes">node</a> in the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/c-gly">cluster</a>.
     * Native name: ClusterResourceRestartNoNotify
     * @type {Integer (Int32)}
     */
    static NoNotify => 1

    /**
     * Restart the resource after a failure. If the resource exceeds its restart threshold within its restart 
     *        period, attempt to fail over the group to another node in the cluster. This is the default setting.
     * Native name: ClusterResourceRestartNotify
     * @type {Integer (Int32)}
     */
    static Notify => 2

    /**
     * Defines the maximum value of the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ne-clusapi-cluster_resource_restart_action">CLUSTER_RESOURCE_RESTART_ACTION</a> enumeration.  It is not a valid value for the 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resources-restartaction">RestartAction</a> property.
     * Native name: ClusterResourceRestartActionCount
     * @type {Integer (Int32)}
     */
    static Count => 3
}
