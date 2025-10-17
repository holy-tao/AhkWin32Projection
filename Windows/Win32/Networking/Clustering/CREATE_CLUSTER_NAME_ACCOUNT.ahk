#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a cluster name resource and domain credentials used by the CreateClusterNameAccount function to add a cluster to a domain. PCREATE_CLUSTER_NAME_ACCOUNT defines a pointer to this structure.
 * @see https://docs.microsoft.com/windows/win32/api//clusapi/ns-clusapi-create_cluster_name_account
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CREATE_CLUSTER_NAME_ACCOUNT extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * The major version of the OS that runs on the cluster. This member must be set to a value greater than <b>CLUSAPI_VERSION_WINDOWSBLUE</b>.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The cluster name that represents the cluster on the domain.
     * @type {PWSTR}
     */
    lpszClusterName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Reserved for future use. This value must be "0".
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The user name for the domain credentials.
     * @type {PWSTR}
     */
    pszUserName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The password for the domain credentials.
     * @type {PWSTR}
     */
    pszPassword {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * The domain name to join.
     * @type {PWSTR}
     */
    pszDomain {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * The management point type.
     * @type {Integer}
     */
    managementPointType {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * 
     * @type {Integer}
     */
    managementPointResType {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }

    /**
     * 
     * @type {BOOLEAN}
     */
    bUpgradeVCOs {
        get => NumGet(this, 56, "char")
        set => NumPut("char", value, this, 56)
    }
}
