#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct CLUSTER_RANGE {
    #StructPack 8

    StartingCluster : Int64

    ClusterCount : Int64

}
