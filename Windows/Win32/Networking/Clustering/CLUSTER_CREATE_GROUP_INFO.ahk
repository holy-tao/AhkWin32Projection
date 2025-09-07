#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The CLUSTER_CREATE_GROUP_INFO structure allows the caller to provide additional properties when creating a new group.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ns-msclus-cluster_create_group_info
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_CREATE_GROUP_INFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The version of the <b>CLUSTER_CREATE_GROUP_INFO</b>.  Currently this is set to (<b>CLUSTER_CREATE_GROUP_INFO_VERSION_1</b> (0x00000001).
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The type of the cluster group that will be created.
     * @type {Integer}
     */
    groupType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
