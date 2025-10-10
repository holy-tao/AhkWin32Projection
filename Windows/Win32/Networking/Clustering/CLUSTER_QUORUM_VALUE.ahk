#Requires AutoHotkey v2.0.0 64-bit

/**
 * Enumerates values returned by the ClusterControl function with the CLUSCTL_CLUSTER_CHECK_VOTER_DOWN or the CLUSCTL_CLUSTER_CHECK_VOTER_EVICT control codes.
 * @see https://docs.microsoft.com/windows/win32/api//msclus/ne-msclus-cluster_quorum_value
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_QUORUM_VALUE{

    /**
     * The quorum will be maintained.
     * @type {Integer (Int32)}
     */
    static CLUSTER_QUORUM_MAINTAINED => 0

    /**
     * The quorum will be lost.
     * @type {Integer (Int32)}
     */
    static CLUSTER_QUORUM_LOST => 1
}
