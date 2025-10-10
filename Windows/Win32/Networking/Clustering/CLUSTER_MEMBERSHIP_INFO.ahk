#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents membership information for a cluster.
 * @see https://docs.microsoft.com/windows/win32/api//msclus/ns-msclus-cluster_membership_info
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_MEMBERSHIP_INFO extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * <b>TRUE</b> if the cluster has a majority quorum; otherwise <b>FALSE</b>.
     * @type {Integer}
     */
    HasQuorum {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The size of the <i>Upnodes</i> parameter.
     * @type {Integer}
     */
    UpnodesSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A byte array that specifies the nodes in the cluster that are online.
     * @type {Array<Byte>}
     */
    Upnodes{
        get {
            if(!this.HasProp("__UpnodesProxyArray"))
                this.__UpnodesProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__UpnodesProxyArray
        }
    }
}
