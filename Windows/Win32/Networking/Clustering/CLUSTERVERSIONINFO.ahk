#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes information about the version of the Cluster service installed locally on a node.
 * @remarks
 * 
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
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//clusapi/ns-clusapi-clusterversioninfo
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTERVERSIONINFO extends Win32Struct
{
    static sizeof => 284

    static packingSize => 4

    /**
     * Size, in bytes, of the data structure. Users must set this size prior to calling 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-getclusterinformation">GetClusterInformation</a>.
     * @type {Integer}
     */
    dwVersionInfoSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Identifies the major version number of the operating system installed on the local node. For example, for 
     *       version X.Y, the major version number is X.
     * @type {Integer}
     */
    MajorVersion {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * Identifies the minor version number of the operating system installed on the local node. For example, for 
     *       version X.Y, the minor version number is Y.
     * @type {Integer}
     */
    MinorVersion {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * Identifies the build number of the operating system installed on the local node, such as 224.
     * @type {Integer}
     */
    BuildNumber {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * Contains the vendor identifier information for the Cluster service installed on the local node.
     * @type {String}
     */
    szVendorId {
        get => StrGet(this.ptr + 10, 63, "UTF-16")
        set => StrPut(value, this.ptr + 10, 63, "UTF-16")
    }

    /**
     * Contains the latest service pack installed on the node. If a Service Pack has not been installed, the 
     *       <b>szCSDVersion</b> member is empty.
     * @type {String}
     */
    szCSDVersion {
        get => StrGet(this.ptr + 138, 63, "UTF-16")
        set => StrPut(value, this.ptr + 138, 63, "UTF-16")
    }

    /**
     * Identifies the highest version of the Cluster service with which the Cluster service installed on the local 
     *       node can join to form a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/c-gly">cluster</a>.
     * @type {Integer}
     */
    dwClusterHighestVersion {
        get => NumGet(this, 268, "uint")
        set => NumPut("uint", value, this, 268)
    }

    /**
     * Identifies the lowest version of the Cluster service with which the Cluster service installed on the local 
     *       node can join to form a cluster.
     * @type {Integer}
     */
    dwClusterLowestVersion {
        get => NumGet(this, 272, "uint")
        set => NumPut("uint", value, this, 272)
    }

    /**
     * If the cluster nodes are running different versions of the Cluster service, this value is set to 
     *       <b>CLUSTER_VERSION_FLAG_MIXED_MODE</b>. If all cluster nodes are running the same version of 
     *       the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/cluster-service">Cluster service</a>, this value is 0.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 276, "uint")
        set => NumPut("uint", value, this, 276)
    }

    /**
     * This value is reserved for internal use.
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 280, "uint")
        set => NumPut("uint", value, this, 280)
    }
}
