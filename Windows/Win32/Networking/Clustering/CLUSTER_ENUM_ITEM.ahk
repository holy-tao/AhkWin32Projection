#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the properties of a cluster object. This structure is used to enumerate clusters in the ClusterEnumEx and ClusterNodeEnumEx functions.
 * @see https://docs.microsoft.com/windows/win32/api//msclus/ns-msclus-cluster_enum_item
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_ENUM_ITEM extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The version of the <b>CLUSTER_ENUM_ITEM</b> structure.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A bitmask that specifies the type of the cluster object.
     * @type {Integer}
     */
    dwType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The size, in bytes, of the <b>lpszId</b> field.
     * @type {Integer}
     */
    cbId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The ID of the cluster.
     * @type {PWSTR}
     */
    lpszId {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The size, in bytes, of the <b>lpszName</b> field.
     * @type {Integer}
     */
    cbName {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The name of the cluster.
     * @type {PWSTR}
     */
    lpszName {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
