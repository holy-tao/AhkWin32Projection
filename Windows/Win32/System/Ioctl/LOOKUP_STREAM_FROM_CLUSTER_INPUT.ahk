#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Passed as input to the FSCTL_LOOKUP_STREAM_FROM_CLUSTER control code.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-lookup_stream_from_cluster_input
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class LOOKUP_STREAM_FROM_CLUSTER_INPUT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Flags for the operation. Currently no flags are defined.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Number of clusters in the following array of clusters. The input buffer must be large enough to contain 
     *       this number or the operation will fail.
     * @type {Integer}
     */
    NumberOfClusters {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * An array of one or more clusters to look up.
     * @type {Array<Int64>}
     */
    Cluster{
        get {
            if(!this.HasProp("__ClusterProxyArray"))
                this.__ClusterProxyArray := Win32FixedArray(this.ptr + 8, 8, Primitive, "int64")
            return this.__ClusterProxyArray
        }
    }
}
