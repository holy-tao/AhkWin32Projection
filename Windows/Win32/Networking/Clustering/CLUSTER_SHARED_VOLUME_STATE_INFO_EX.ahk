#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents information about the state of a Cluster Shared Volume (CSV).
 * @see https://docs.microsoft.com/windows/win32/api//clusapi/ns-clusapi-cluster_shared_volume_state_info_ex
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_SHARED_VOLUME_STATE_INFO_EX extends Win32Struct
{
    static sizeof => 1584

    static packingSize => 8

    /**
     * A Unicode string that contains the volume name of the CSV. The string ends in a terminating null character. The name that is provided can be either the cluster-assigned friendly name or the volume GUID path of the form "\\?\Volume{xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}\".
     * @type {String}
     */
    szVolumeName {
        get => StrGet(this.ptr + 0, 259, "UTF-16")
        set => StrPut(value, this.ptr + 0, 259, "UTF-16")
    }

    /**
     * The node name of the node that hosts the CSV.
     * @type {String}
     */
    szNodeName {
        get => StrGet(this.ptr + 520, 259, "UTF-16")
        set => StrPut(value, this.ptr + 520, 259, "UTF-16")
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/ne-clusapi-cluster_shared_volume_state">CLUSTER_SHARED_VOLUME_STATE</a> enumeration value that specifies the state of the CSV.
     * @type {Integer}
     */
    VolumeState {
        get => NumGet(this, 1040, "int")
        set => NumPut("int", value, this, 1040)
    }

    /**
     * The friendly name of the CSV.
     * @type {String}
     */
    szVolumeFriendlyName {
        get => StrGet(this.ptr + 1044, 259, "UTF-16")
        set => StrPut(value, this.ptr + 1044, 259, "UTF-16")
    }

    /**
     * A bitmask that  specifies more specific reasons for the values stated in the <i>VolumeRedirectedIOReason</i> parameter.
     * @type {Integer}
     */
    RedirectedIOReason {
        get => NumGet(this, 1568, "uint")
        set => NumPut("uint", value, this, 1568)
    }

    /**
     * A bitmask that  specifies the reasons that direct access mode is enabled on the CSV.
     * @type {Integer}
     */
    VolumeRedirectedIOReason {
        get => NumGet(this, 1576, "uint")
        set => NumPut("uint", value, this, 1576)
    }
}
