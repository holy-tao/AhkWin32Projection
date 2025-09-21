#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains the security object information.
 * @remarks
 * When the <b>Id</b> member the <b>SECURITY_OBJECT</b> structure is set to SECURITY_OBJECT_ID_CENTRAL_ACCESS_RULE, the <a href="https://docs.microsoft.com/windows/desktop/api/aclui/nf-aclui-ieffectivepermission2-computeeffectivepermissionwithsecondarysecurity">ComputeEffectivePermissionWithSecondarySecurity</a> method must use the <b>pData2</b> member of  first and only then evaluate the access  using the  <b>pData</b> member.
 * @see https://learn.microsoft.com/windows/win32/api/aclui/ns-aclui-security_object
 * @namespace Windows.Win32.Security.Authorization.UI
 * @version v4.0.30319
 */
class SECURITY_OBJECT extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * A pointer to the name.
     * @type {Pointer<Char>}
     */
    pwszName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A pointer to the security data.
     * @type {Pointer<Void>}
     */
    pData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The size, in bytes, of the data pointed to by the <b>pData</b> member. This may be zero if <b>pData</b> contains the data, such as when the data is an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface pointer, a handle, or data specific to the resource manager that can be stored in <b>pData</b> directly without a memory allocation.
     * @type {Integer}
     */
    cbData {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A pointer to the additional security data.
     * @type {Pointer<Void>}
     */
    pData2 {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The size, in bytes, of the data pointed to by the <b>pData2</b> member. This may be zero if <b>pData2</b> contains the data, such as when the data is an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface pointer, a handle, or data specific to the resource manager that can be stored in <b>pData2</b> directly without a memory allocation.
     * @type {Integer}
     */
    cbData2 {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The identifier for the security object's type. If the <b>fWellKnown</b> member is <b>FALSE</b>, then the <b>Id</b> member has no special significance other than to help resource managers distinguish it from other classes of security objects. If the <b>fWellKnown</b> member is <b>TRUE</b>, then the <b>Id</b> member is one of the following and the entire structure follows the corresponding representation.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SECURITY_OBJECT_ID_OBJECT_SD___1_"></a><a id="security_object_id_object_sd___1_"></a><dl>
     * <dt><b>SECURITY_OBJECT_ID_OBJECT_SD  (1)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security descriptor of the resource.
     * 
     * 
     * If <b>Id</b> is set to this value, then <b>pData</b> points to a security descriptor and <b>cbData</b> is the number of bytes in <b>pData</b>.
     * 
     * 
     * <b>pData2</b> is <b>NULL</b> and <b>cbData2</b> is 0.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SECURITY_OBJECT_ID_SHARE___2_"></a><a id="security_object_id_share___2_"></a><dl>
     * <dt><b>SECURITY_OBJECT_ID_SHARE  (2)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security descriptor of a network share.
     * 
     * If <b>Id</b> is set to this value, then <b>pData</b> points to the <a href="https://docs.microsoft.com/windows/desktop/api/aclui/nn-aclui-isecurityinformation">ISecurityInformation</a> interface of an object that represents the security context of the share.
     * 
     * If the security descriptor is not yet available, then <b>pData2</b> must be a handle to a waitable object that is signaled when the security descriptor is ready when the <a href="https://docs.microsoft.com/windows/desktop/api/aclui/nf-aclui-isecurityinformation4-getsecondarysecurity">GetSecondarySecurity</a> method returns S_FALSE. The waitable object should be created by the <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createeventa">CreateEvent</a>  function. In this case, <b>cbData2</b> is 0.
     * 
     * This identifier is only applicable to file system objects.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SECURITY_OBJECT_ID_CENTRAL_POLICY__3_"></a><a id="security_object_id_central_policy__3_"></a><dl>
     * <dt><b>SECURITY_OBJECT_ID_CENTRAL_POLICY (3)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security descriptor of a central access policy.
     * 
     * If <b>Id</b> is set to this value, then <b>pData</b> points to the security descriptor with an empty DACL, an owner, group, and attribute <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control entries</a> (ACEs) that match the resource's owner, group, and attributes as well as a SCOPE_SECURITY_INFORMATION_ACE  that contains the central policy's ID. <b>cbData</b> is set to the number of bytes in <b>pData</b>.
     * 
     * <b>pData2</b> is <b>NULL</b> and <b>cbData2</b> is 0.
     * 
     * The security descriptor is constructed to allow computing effective permissions to correctly determine when access is limited by the central policy and higher detail of the central access rule cannot be determined. This is used when a central access policy that applies to a resource cannot be resolved into its elemental central access rules.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SECURITY_OBJECT_ID_CENTRAL_ACCESS_RULE__4_"></a><a id="security_object_id_central_access_rule__4_"></a><dl>
     * <dt><b>SECURITY_OBJECT_ID_CENTRAL_ACCESS_RULE (4)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security descriptor of a central access rule.
     * 
     * If <b>Id</b> is set to this value, then <b>pData</b> points to the security descriptor with an owner, group, and attribute ACEs that match the resource's owner, group, and attributes, and a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">discretionary access control list</a> (DACL) that matches the central access rule's DACL. <b>cbData</b> is set to the number of bytes in <b>pData</b>.
     * 
     * In addition, <b>pData2</b> points to a security descriptor with a DACL that contains a conditional ACE that grants 0x1 to Everyone if the resource condition from the central access rule evaluates to <b>TRUE</b>. <b>cbData2</b> is set to the number of bytes in <b>pData2</b>.
     * 
     * The security descriptor is constructed to allow computing effective permissions to determine when access is limited by the central access policy at the highest detail. That is, access is limited by pointing to a central policy rule.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Id {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * <b>TRUE</b> if the security object represents one of the well-know security objects listed in the <b>Id</b> member.
     * @type {Integer}
     */
    fWellKnown {
        get => NumGet(this, 40, "char")
        set => NumPut("char", value, this, 40)
    }
}
