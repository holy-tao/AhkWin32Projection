#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents the properties of a cluster resource. This structure is used to enumerate cluster resources in the ClusterResourceEnumEx function.
 * @see https://docs.microsoft.com/windows/win32/api//msclus/ns-msclus-cluster_resource_enum_item
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_RESOURCE_ENUM_ITEM extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * The version of this structure.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size, in bytes, of the <b>lpszId</b> field.
     * @type {Integer}
     */
    cbId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The ID of the cluster resource.
     * @type {Pointer<Char>}
     */
    lpszId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The size, in bytes, of the <b>IpszName</b> field.
     * @type {Integer}
     */
    cbName {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The name of the cluster resource.
     * @type {Pointer<Char>}
     */
    lpszName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The size, in bytes, of the <b>IpszOwnerNode</b> field.
     * @type {Integer}
     */
    cbOwnerGroupName {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The name of the cluster resource that  hosts the group.
     * @type {Pointer<Char>}
     */
    lpszOwnerGroupName {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * The size, in bytes, of the <b>lpszOwnerGroupId</b> field.
     * @type {Integer}
     */
    cbOwnerGroupId {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * The group ID of the cluster group for the resource.
     * @type {Pointer<Char>}
     */
    lpszOwnerGroupId {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * The size, in bytes, of the <b>pProperties</b> field.
     * @type {Integer}
     */
    cbProperties {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * A pointer to a list of names of common properties.
     * @type {Pointer<Void>}
     */
    pProperties {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * The size, in bytes, of the <b>pRoProperties</b> field.
     * @type {Integer}
     */
    cbRoProperties {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * A pointer to a list of names of read-only common properties.
     * @type {Pointer<Void>}
     */
    pRoProperties {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }
}
