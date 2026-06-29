#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\CLUSTER_MGMT_POINT_RESTYPE.ahk" { CLUSTER_MGMT_POINT_RESTYPE }
#Import ".\CLUSTER_MGMT_POINT_TYPE.ahk" { CLUSTER_MGMT_POINT_TYPE }

/**
 * Describes a cluster name resource and domain credentials used by the CreateClusterNameAccount function to add a cluster to a domain. PCREATE_CLUSTER_NAME_ACCOUNT defines a pointer to this structure.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-create_cluster_name_account
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CREATE_CLUSTER_NAME_ACCOUNT {
    #StructPack 8

    /**
     * The major version of the OS that runs on the cluster. This member must be set to a value greater than <b>CLUSAPI_VERSION_WINDOWSBLUE</b>.
     */
    dwVersion : UInt32

    /**
     * The cluster name that represents the cluster on the domain.
     */
    lpszClusterName : PWSTR

    /**
     * Reserved for future use. This value must be "0".
     */
    dwFlags : UInt32

    /**
     * The user name for the domain credentials.
     */
    pszUserName : PWSTR

    /**
     * The password for the domain credentials.
     */
    pszPassword : PWSTR

    /**
     * The domain name to join.
     */
    pszDomain : PWSTR

    /**
     * The management point type.
     */
    managementPointType : CLUSTER_MGMT_POINT_TYPE

    managementPointResType : CLUSTER_MGMT_POINT_RESTYPE

    bUpgradeVCOs : BOOLEAN

}
