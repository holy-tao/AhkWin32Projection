#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUSTER_RESOURCE_STATE.ahk" { CLUSTER_RESOURCE_STATE }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains data about the state of a provider resource.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clus_provider_state_change_info
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUS_PROVIDER_STATE_CHANGE_INFO {
    #StructPack 4

    /**
     * The size of this structure including the provider name and the terminating null character.
     */
    dwSize : UInt32

    /**
     * An enumerator from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ne-clusapi-cluster_resource_state">CLUSTER_RESOURCE_STATE</a> enumeration as its value.  The following are the possible values for this member.
     */
    resourceState : CLUSTER_RESOURCE_STATE

    /**
     * The globally unique ID of the provider resource. This value can also be passed to the <i>lpszResourceName</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-openclusterresource">OpenClusterResource</a> function instead of a resource's name.
     */
    szProviderId : WCHAR[1]

}
