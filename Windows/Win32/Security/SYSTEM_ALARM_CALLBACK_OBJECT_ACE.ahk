#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SYSTEM_AUDIT_OBJECT_ACE_FLAGS.ahk" { SYSTEM_AUDIT_OBJECT_ACE_FLAGS }
#Import ".\ACE_HEADER.ahk" { ACE_HEADER }
#Import "..\..\..\Guid.ahk" { Guid }

/**
 * The SYSTEM_ALARM_CALLBACK_OBJECT_ACE structure is reserved for future use.
 * @remarks
 * If neither the <b>ObjectType</b> nor <b>InheritedObjectType</b> GUID is specified, the <b>SYSTEM_ALARM_CALLBACK_OBJECT_ACE</b> structure has the same semantics as the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-system_alarm_callback_ace">SYSTEM_ALARM_CALLBACK_ACE</a> structure. In that case, use the 
 * <b>SYSTEM_ALARM_CALLBACK_ACE</b> structure because it is smaller and more efficient.
 * 
 * An ACL that contains an <b>SYSTEM_ALARM_CALLBACK_OBJECT_ACE</b> must specify the ACL_REVISION_DS revision number in its 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-ace_header">ACE_HEADER</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-system_alarm_callback_object_ace
 * @namespace Windows.Win32.Security
 */
export default struct SYSTEM_ALARM_CALLBACK_OBJECT_ACE {
    #StructPack 4

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-ace_header">ACE_HEADER</a> structure that specifies the size and type of ACE. It contains flags that control inheritance of the ACE by child objects. The structure also contains flags that indicate whether the ACE audits successful access attempts, failed access attempts, or both. The <b>AceType</b> member of the <b>ACE_HEADER</b> structure should be set to SYSTEM_ALARM_CALLBACK_OBJECT_ACE_TYPE.
     */
    Header : ACE_HEADER

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-mask">ACCESS_MASK</a> that specifies the access rights the system will audit for access attempts by the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/t-gly">trustee</a>.
     */
    Mask : UInt32

    Flags : SYSTEM_AUDIT_OBJECT_ACE_FLAGS

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a> structure that identifies a property set, property, extended right, or type of child object. 
     * 
     * 
     * 
     * 
     * This member is valid only if the ACE_OBJECT_TYPE_PRESENT bit is set in the <b>Flags</b> member. Otherwise, <b>ObjectType</b> is ignored.
     * 
     * The purpose of this GUID depends on the access rights specified in the <b>Mask</b> member.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ADS_RIGHT_DS_READ_PROP_and_or_ADS_RIGHT_DS_WRITE_PROP"></a><a id="ads_right_ds_read_prop_and_or_ads_right_ds_write_prop"></a><a id="ADS_RIGHT_DS_READ_PROP_AND_OR_ADS_RIGHT_DS_WRITE_PROP"></a><dl>
     * <dt><b>ADS_RIGHT_DS_READ_PROP and/or ADS_RIGHT_DS_WRITE_PROP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>ObjectType</b> GUID identifies a property set or property of the object. The ACE controls auditing of the trustee's attempts to read or write the property or property set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ADS_RIGHT_DS_CONTROL_ACCESS"></a><a id="ads_right_ds_control_access"></a><dl>
     * <dt><b>ADS_RIGHT_DS_CONTROL_ACCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>ObjectType</b> GUID identifies an extended access right.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ADS_RIGHT_DS_CREATE_CHILD"></a><a id="ads_right_ds_create_child"></a><dl>
     * <dt><b>ADS_RIGHT_DS_CREATE_CHILD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>ObjectType</b> GUID identifies a type of child object. The ACE controls auditing of the trustee's attempts to create this type of child object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ADS_RIGHT_DS_SELF"></a><a id="ads_right_ds_self"></a><dl>
     * <dt><b>ADS_RIGHT_DS_SELF</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>ObjectType</b> GUID identifies a validated write.
     * 
     * </td>
     * </tr>
     * </table>
     */
    ObjectType : Guid

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a> structure that identifies the type of child object that can inherit the ACE. 
     * 
     * 
     * 
     * 
     * This member is valid only if the ACE_INHERITED_OBJECT_TYPE_PRESENT bit is set in the <b>Flags</b> member. If that bit is not set, <b>InheritedObjectType</b> is ignored and all types of child objects can inherit the ACE. In either case, inheritance is also controlled by the inheritance flags in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-ace_header">ACE_HEADER</a>, as well as by any protection against inheritance placed on the child objects.
     */
    InheritedObjectType : Guid

    /**
     * The first <b>DWORD</b> of a trustee's ACE. This ACE can be appended with application data. When the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/authzaccesscheckcallback">AuthzAccessCheckCallback</a> function is called, this ACE is passed as the <i>pAce</i> parameter of that function.
     */
    SidStart : UInt32

}
