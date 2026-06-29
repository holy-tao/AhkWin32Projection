#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Describes information about the version of the Cluster service installed locally on a node.
 * @remarks
 * To obtain cluster version information, applications declare a 
 *     <b>CLUSTERVERSIONINFO</b> structure, specify the size of the 
 *     structure in the <b>dwVersionInfoSize</b> member, and call the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-getclusterinformation">GetClusterInformation</a> function. 
 *     <b>GetClusterInformation</b> fills in the structure 
 *     member data.
 * 
 * To prevent overwrites for all possible combinations of version information, always set 
 *     <b>dwVersionInfoSize</b> to:
 * 
 * <c>sizeof(CLUSTERVERSIONINFO)</c>
 * 
 * The <b>dwClusterHighestVersion</b> and <b>dwClusterLowestVersion</b> 
 *     values indicate whether the local node can join with another node to form a cluster. A join can succeed if one of 
 *     the following is true:
 * 
 * <ul>
 * <li>The local node's highest version exactly matches the other node's highest version.</li>
 * <li>The local node's lowest version exactly matches the other node's highest version.</li>
 * <li>The local node's highest version exactly matches the other node's lowest version.</li>
 * </ul>
 * For more information on how the Cluster service creates and uses version numbers, see 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/version-compatibility">Version Compatibility</a>.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clusterversioninfo
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSTERVERSIONINFO {
    #StructPack 4

    /**
     * Size, in bytes, of the data structure. Users must set this size prior to calling 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-getclusterinformation">GetClusterInformation</a>.
     */
    dwVersionInfoSize : UInt32

    /**
     * Identifies the major version number of the operating system installed on the local node. For example, for 
     *       version X.Y, the major version number is X.
     */
    MajorVersion : UInt16

    /**
     * Identifies the minor version number of the operating system installed on the local node. For example, for 
     *       version X.Y, the minor version number is Y.
     */
    MinorVersion : UInt16

    /**
     * Identifies the build number of the operating system installed on the local node, such as 224.
     */
    BuildNumber : UInt16

    /**
     * Contains the vendor identifier information for the Cluster service installed on the local node.
     */
    szVendorId : WCHAR[64]

    /**
     * Contains the latest service pack installed on the node. If a Service Pack has not been installed, the 
     *       <b>szCSDVersion</b> member is empty.
     */
    szCSDVersion : WCHAR[64]

    /**
     * Identifies the highest version of the Cluster service with which the Cluster service installed on the local 
     *       node can join to form a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/c-gly">cluster</a>.
     */
    dwClusterHighestVersion : UInt32

    /**
     * Identifies the lowest version of the Cluster service with which the Cluster service installed on the local 
     *       node can join to form a cluster.
     */
    dwClusterLowestVersion : UInt32

    /**
     * If the cluster nodes are running different versions of the Cluster service, this value is set to 
     *       <b>CLUSTER_VERSION_FLAG_MIXED_MODE</b>. If all cluster nodes are running the same version of 
     *       the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/cluster-service">Cluster service</a>, this value is 0.
     */
    dwFlags : UInt32

    /**
     * This value is reserved for internal use.
     */
    dwReserved : UInt32

}
