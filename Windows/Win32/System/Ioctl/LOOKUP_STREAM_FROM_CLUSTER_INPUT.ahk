#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Passed as input to the FSCTL_LOOKUP_STREAM_FROM_CLUSTER control code.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-lookup_stream_from_cluster_input
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct LOOKUP_STREAM_FROM_CLUSTER_INPUT {
    #StructPack 8

    /**
     * Flags for the operation. Currently no flags are defined.
     */
    Flags : UInt32

    /**
     * Number of clusters in the following array of clusters. The input buffer must be large enough to contain 
     *       this number or the operation will fail.
     */
    NumberOfClusters : UInt32

    /**
     * An array of one or more clusters to look up.
     */
    Cluster : Int64[1]

}
