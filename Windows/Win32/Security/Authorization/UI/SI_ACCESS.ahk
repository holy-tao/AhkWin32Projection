#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains information about an access right or default access mask for a securable object.
 * @see https://learn.microsoft.com/windows/win32/api/aclui/ns-aclui-si_access
 * @namespace Windows.Win32.Security.Authorization.UI
 * @version v4.0.30319
 */
class SI_ACCESS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A pointer to a 
     * <a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a> structure that identifies the type of object to which the access right or default access mask applies. The GUID can identify a property set or property on the object, or a type of child object that can be contained by the object. 
     * 
     * 
     * 
     * 
     * If this member points to GUID_NULL, the access right applies to the object itself.
     * @type {Pointer<Guid>}
     */
    pguid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A bitmask that specifies the access right described by this structure. The mask can contain any combination of standard and specific rights, but should not contain generic rights such as GENERIC_ALL.
     * @type {Integer}
     */
    mask {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A pointer to a null-terminated <a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">Unicode</a> string containing a display string that describes the access right. 
     * 
     * 
     * 
     * 
     * Alternatively, <b>pszName</b> can be a string resource identifier returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a> macro. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/aclui/nf-aclui-isecurityinformation-getobjectinformation">ISecurityInformation::GetObjectInformation</a> method to identify the module that contains the string resource.
     * @type {Pointer<Ptr>}
     */
    pszName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A set of bit flags that indicate where the access right is displayed. This member can be a combination of the following. 
     * 
     * 
     * 
     * 
     * 						
     * 						
     * 					
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SI_ACCESS_SPECIFIC"></a><a id="si_access_specific"></a><dl>
     * <dt><b>SI_ACCESS_SPECIFIC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The access right is displayed on the advanced security pages.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SI_ACCESS_GENERAL"></a><a id="si_access_general"></a><dl>
     * <dt><b>SI_ACCESS_GENERAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The access right is displayed on the basic security page.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SI_ACCESS_CONTAINER"></a><a id="si_access_container"></a><dl>
     * <dt><b>SI_ACCESS_CONTAINER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates an access right that applies only to containers. If this flag is set, the access right is displayed on the basic security page only if the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/aclui/nf-aclui-isecurityinformation-getobjectinformation">ISecurityInformation::GetObjectInformation</a> method specifies the SI_CONTAINER flag.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SI_ACCESS_PROPERTY"></a><a id="si_access_property"></a><dl>
     * <dt><b>SI_ACCESS_PROPERTY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a property-specific access right. Used with SI_EDIT_PROPERTIES.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * This member can also specify a combination of the following flags to indicate whether other containers or objects can inherit the access right.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CONTAINER_INHERIT_ACE"></a><a id="container_inherit_ace"></a><dl>
     * <dt><b>CONTAINER_INHERIT_ACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Other containers that are contained by the primary object inherit the entry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="INHERIT_ONLY_ACE"></a><a id="inherit_only_ace"></a><dl>
     * <dt><b>INHERIT_ONLY_ACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The ACE does not apply to the primary object to which the ACL is attached, but objects contained by the primary object inherit the entry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OBJECT_INHERIT_ACE"></a><a id="object_inherit_ace"></a><dl>
     * <dt><b>OBJECT_INHERIT_ACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Noncontainer objects contained by the primary object inherit the entry.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
