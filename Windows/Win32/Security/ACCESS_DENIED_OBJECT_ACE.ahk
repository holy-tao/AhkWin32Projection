#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include .\ACE_HEADER.ahk

/**
 * Defines an access control entry (ACE) that controls denied access to an object, a property set, or property.
 * @remarks
 * If neither the <b>ObjectType</b> nor <b>InheritedObjectType</b> <b>GUID</b> is specified, the <b>ACCESS_DENIED_OBJECT_ACE</b> structure has the same semantics as those used by the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-access_denied_ace">ACCESS_DENIED_ACE</a> structure. In that case, use the 
  * <b>ACCESS_DENIED_ACE</b> structure because it is smaller and more efficient.
  * 
  * An ACL that contains an <b>ACCESS_DENIED_OBJECT_ACE</b> must specify the ACL_REVISION_DS revision number in its 
  * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a> header.
  * 
  * The access rights specified by the <b>Mask</b> member are denied to any <a href="https://docs.microsoft.com/windows/desktop/SecGloss/t-gly">trustee</a> that possesses an enabled SID that matches the SID stored in the <b>SidStart</b> member.
  * 
  * An <b>ACCESS_DENIED_OBJECT_ACE</b> structure can be created in an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control list</a> (ACL) by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-addaccessdeniedobjectace">AddAccessDeniedObjectAce</a> function. When this function is used, the correct amount of memory needed to accommodate the GUID structures in the <b>ObjectType</b> and <b>InheritedObjectType</b> members, if one or both of them exists, as well as to accommodate the trustee's SID is automatically allocated.  In addition, the values of the <b>Header.AceType</b> and <b>Header.AceSize</b> members are set automatically.	When an <b>ACCESS_DENIED_OBJECT_ACE</b> structure is created outside an ACL, sufficient memory must be allocated to accommodate the GUID structures in the <b>ObjectType</b> and <b>InheritedObjectType</b> members, if one or both of them exists, as well as to accommodate the complete SID of the trustee in the <b>SidStart</b> member and the contiguous memory following it. In addition, the values of the <b>Header.AceType</b> and <b>Header.AceSize</b> members must be set explicitly by the application.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-access_denied_object_ace
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class ACCESS_DENIED_OBJECT_ACE extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-ace_header">ACE_HEADER</a> structure that specifies the size and type of ACE. It contains flags that control inheritance of the ACE by child objects. The <b>AceType</b> member of the <b>ACE_HEADER</b> structure should be set to ACCESS_DENIED_OBJECT_ACE_TYPE, and the <b>AceSize</b> member should be set to the total number of bytes allocated for the <b>ACCESS_DENIED_OBJECT_ACE</b> structure.
     * @type {ACE_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := ACE_HEADER(this.ptr + 0)
            return this.__Header
        }
    }

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-mask">ACCESS_MASK</a> that specifies the access rights the system will deny to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/t-gly">trustee</a>.
     * @type {Integer}
     */
    Mask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * 
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * This member exists only if the ACE_OBJECT_TYPE_PRESENT bit is set in the <b>Flags</b> member. Otherwise, the <b>InheritedObjectType</b> member follows immediately after the <b>Flags</b> member. 
     * 
     * 
     * 
     * 
     * If this member exists, it is a 
     * <a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a> structure that identifies a property set, property, extended right, or type of child object. The purpose of this <b>GUID</b> depends on the access rights specified in the <b>Mask</b> member.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ADS_RIGHT_DS_CONTROL_ACCESS"></a><a id="ads_right_ds_control_access"></a><dl>
     * <dt><b>ADS_RIGHT_DS_CONTROL_ACCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>ObjectType</b> <b>GUID</b> identifies an extended access right.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ADS_RIGHT_DS_CREATE_CHILD"></a><a id="ads_right_ds_create_child"></a><dl>
     * <dt><b>ADS_RIGHT_DS_CREATE_CHILD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>ObjectType</b> <b>GUID</b> identifies a type of child object. The ACE controls the trustee's right to create this type of child object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ADS_RIGHT_DS_READ_PROP"></a><a id="ads_right_ds_read_prop"></a><dl>
     * <dt><b>ADS_RIGHT_DS_READ_PROP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>ObjectType</b> <b>GUID</b> identifies a property set or property of the object. The ACE controls the trustee's right to read the property or property set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ADS_RIGHT_DS_WRITE_PROP"></a><a id="ads_right_ds_write_prop"></a><dl>
     * <dt><b>ADS_RIGHT_DS_WRITE_PROP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>ObjectType</b> <b>GUID</b> identifies a property set or property of the object. The ACE controls the trustee's right to write the property or property set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ADS_RIGHT_DS_SELF"></a><a id="ads_right_ds_self"></a><dl>
     * <dt><b>ADS_RIGHT_DS_SELF</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>ObjectType</b> <b>GUID</b> identifies a validated write.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Pointer<Guid>}
     */
    ObjectType {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * This member exists only if the ACE_INHERITED_OBJECT_TYPE_PRESENT bit is set in the <b>Flags</b> member. 
     * 
     * 
     * 
     * 
     * If this member exists, it is a 
     * <a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a> structure that identifies the type of child object that can inherit the ACE. Inheritance is also controlled by the inheritance flags in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-ace_header">ACE_HEADER</a>, as well as by any protection against inheritance placed on the child objects.
     * 
     * The offset of this member can vary. If the <b>Flags</b> member does not contain the ACE_OBJECT_TYPE_PRESENT flag, the <b>InheritedObjectType</b> member starts at the offset specified by the <b>ObjectType</b> member.
     * @type {Pointer<Guid>}
     */
    InheritedObjectType {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Specifies the first <b>DWORD</b> of a SID that identifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/t-gly">trustee</a> for whom the access rights are denied. The remaining bytes of the SID  are stored in contiguous memory after the <b>SidStart</b> member. This SID can be appended with application data. 
     * 
     * 
     * 
     * 
     * The offset of this member can vary. If the <b>Flags</b> member is zero, the <b>SidStart</b> member starts at the offset specified by the <b>ObjectType</b> member. If <b>Flags</b> contains only one flag (either ACE_OBJECT_TYPE_PRESENT or ACE_INHERITED_OBJECT_TYPE_PRESENT), the <b>SidStart</b> member starts at the offset specified by the <b>InheritedObjectType</b> member.
     * @type {Integer}
     */
    SidStart {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
