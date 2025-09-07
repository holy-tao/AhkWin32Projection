#Requires AutoHotkey v2.0.0 64-bit

/**
 * The NODE_CLUSTER_STATE enumeration (msclus.h) indicates the state of the cluster.
 * @remarks
 * The following constants are defined in ClusAPI.h.
  * 
  * <table>
  * <tr>
  * <th>Constant</th>
  * <th>Value</th>
  * </tr>
  * <tr>
  * <td>
  * <b>CLUSTER_INSTALLED</b>
  * 
  * </td>
  * <td>
  * 0x00000001
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * <b>CLUSTER_CONFIGURED</b>
  * 
  * </td>
  * <td>
  * 0x00000002
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * <b>CLUSTER_RUNNING</b>
  * 
  * </td>
  * <td>
  * 0x00000010
  * 
  * </td>
  * </tr>
  * </table>
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-node_cluster_state
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class NODE_CLUSTER_STATE{

    /**
     * The Cluster service is not installed on the node.
     * @type {Integer (Int32)}
     */
    static ClusterStateNotInstalled => 0

    /**
     * The Cluster service is installed on the node but has not yet been configured.
     * @type {Integer (Int32)}
     */
    static ClusterStateNotConfigured => 1

    /**
     * The Cluster service is installed and configured on the node but is not currently running.
     * @type {Integer (Int32)}
     */
    static ClusterStateNotRunning => 3

    /**
     * The Cluster service is installed, configured, and running on the node.
     * @type {Integer (Int32)}
     */
    static ClusterStateRunning => 19
}
