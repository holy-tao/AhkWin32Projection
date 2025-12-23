#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies information about the list of nodes sufficient to establish quorum in a majority-of-nodes cluster.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clus_force_quorum_info
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUS_FORCE_QUORUM_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The total size of the structure, including the nodes list.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A bit mask representing the maximum assumed node set.
     * @type {Integer}
     */
    dwNodeBitMask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The number of bits set in the mask
     * @type {Integer}
     */
    dwMaxNumberofNodes {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The names of the nodes that are sufficient to establish quorum in a majority-of-nodes cluster. This list should be comma delimited with no spaces.
     * @type {String}
     */
    multiszNodeList {
        get => StrGet(this.ptr + 12, 0, "UTF-16")
        set => StrPut(value, this.ptr + 12, 0, "UTF-16")
    }
}
