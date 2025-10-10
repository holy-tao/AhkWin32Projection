#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains data about the state of a provider resource.
 * @see https://docs.microsoft.com/windows/win32/api//clusapi/ns-clusapi-clus_provider_state_change_info
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUS_PROVIDER_STATE_CHANGE_INFO extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * The size of this structure including the provider name and the terminating null character.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An enumerator from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ne-clusapi-cluster_resource_state">CLUSTER_RESOURCE_STATE</a> enumeration as its value.  The following are the possible values for this member.
     * @type {Integer}
     */
    resourceState {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * The globally unique ID of the provider resource. This value can also be passed to the <i>lpszResourceName</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-openclusterresource">OpenClusterResource</a> function instead of a resource's name.
     * @type {String}
     */
    szProviderId {
        get => StrGet(this.ptr + 8, 0, "UTF-16")
        set => StrPut(value, this.ptr + 8, 0, "UTF-16")
    }
}
