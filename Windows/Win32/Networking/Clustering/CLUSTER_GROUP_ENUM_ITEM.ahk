#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The CLUSTER_GROUP_ENUM_ITEM structure contains the properties of a cluster group. (CLUSTER_GROUP_ENUM_ITEM)
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ns-msclus-cluster_group_enum_item
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_GROUP_ENUM_ITEM extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * The version of the 
     *       <b>CLUSTER_GROUP_ENUM_ITEM</b> structure.
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
     * The Id of the cluster group.
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
     * The name of the cluster group.
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
     * The current state of the cluster group.
     * @type {Integer}
     */
    state {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * The size, in bytes, of the <b>IpszOwnerNode</b> field.
     * @type {Integer}
     */
    cbOwnerNode {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * The name of the cluster node hosting the group.
     * @type {PWSTR}
     */
    lpszOwnerNode{
        get {
            if(!this.HasProp("__lpszOwnerNode"))
                this.__lpszOwnerNode := PWSTR(this.ptr + 40)
            return this.__lpszOwnerNode
        }
    }

    /**
     * The group flags.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * The size, in bytes, of the <b>pProperties</b> field.
     * @type {Integer}
     */
    cbProperties {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * A pointer to a list of names of common properties.
     * @type {Pointer<Void>}
     */
    pProperties {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * The size, in bytes, of the <b>pRoProperties</b> field.
     * @type {Integer}
     */
    cbRoProperties {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * A pointer to a list of names of read-only common properties.
     * @type {Pointer<Void>}
     */
    pRoProperties {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }
}
