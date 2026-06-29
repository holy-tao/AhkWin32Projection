#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The CLUSTER_MEMBERSHIP_INFO structure represents membership information for a cluster. (CLUSTER_MEMBERSHIP_INFO)
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ns-msclus-cluster_membership_info
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSTER_MEMBERSHIP_INFO {
    #StructPack 4

    /**
     * <b>TRUE</b> if the cluster has a majority quorum; otherwise <b>FALSE</b>.
     */
    HasQuorum : BOOL

    /**
     * The size of the <i>Upnodes</i> parameter.
     */
    UpnodesSize : UInt32

    /**
     * A byte array that specifies the nodes in the cluster that are online.
     */
    Upnodes : Int8[1]

}
