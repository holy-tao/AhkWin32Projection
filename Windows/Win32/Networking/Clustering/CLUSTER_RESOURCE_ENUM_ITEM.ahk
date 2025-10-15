#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

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
     * @type {PWSTR}
     */
    lpszId{
        get {
            if(!this.HasProp("__lpszId"))
                this.__lpszId := PWSTR(this.ptr + 8)
            return this.__lpszId
        }
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
     * @type {PWSTR}
     */
    lpszName{
        get {
            if(!this.HasProp("__lpszName"))
                this.__lpszName := PWSTR(this.ptr + 24)
            return this.__lpszName
        }
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
     * @type {PWSTR}
     */
    lpszOwnerGroupName{
        get {
            if(!this.HasProp("__lpszOwnerGroupName"))
                this.__lpszOwnerGroupName := PWSTR(this.ptr + 40)
            return this.__lpszOwnerGroupName
        }
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
     * @type {PWSTR}
     */
    lpszOwnerGroupId{
        get {
            if(!this.HasProp("__lpszOwnerGroupId"))
                this.__lpszOwnerGroupId := PWSTR(this.ptr + 56)
            return this.__lpszOwnerGroupId
        }
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
