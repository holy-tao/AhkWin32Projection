#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IGPMPermission interface contains methods to retrieve permission-related properties when using the GPMC.
 * @remarks
 * The interface divides the policy-related permissions into categories. The following table lists the categories, permissions included in the categories, and the object to which they can be applied, as  defined in the GPMPermissionType.
 * 
 * <table>
 * <tr>
 * <th>Securable object</th>
 * <th>Permission category</th>
 * <th>Permission level</th>
 * </tr>
 * <tr>
 * <td>
 * Site
 * 
 * </td>
 * <td>
 * GPO linking
 * 
 * </td>
 * <td>
 * permSOMLink
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * OU
 * 
 * </td>
 * <td>
 * GPO linking
 * 
 * </td>
 * <td>
 * permSOMLink
 * 
 * </td>
 * </tr>
 * <tr>
 * <td></td>
 * <td>
 * RSoP logging
 * 
 * </td>
 * <td>
 * permSOMLogging
 * 
 * </td>
 * </tr>
 * <tr>
 * <td></td>
 * <td>
 * RSoP planning
 * 
 * </td>
 * <td>
 * permSOMPlanning
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * Domain
 * 
 * </td>
 * <td>
 * GPO linking
 * 
 * </td>
 * <td>
 * permSOMLink
 * 
 * </td>
 * </tr>
 * <tr>
 * <td></td>
 * <td>
 * Creating GPOs
 * 
 * </td>
 * <td>
 * permSOMGPOCreate
 * 
 * </td>
 * </tr>
 * <tr>
 * <td></td>
 * <td>
 * RSoP logging
 * 
 * </td>
 * <td>
 * permSOMLogging
 * 
 * </td>
 * </tr>
 * <tr>
 * <td></td>
 * <td>
 * RSoP planning
 * 
 * </td>
 * <td>
 * permSOMPlanning
 * 
 * </td>
 * </tr>
 * <tr>
 * <td></td>
 * <td>
 * Creating WMI filters
 * 
 * </td>
 * <td>
 * permSOMWMICreate
 * 
 * </td>
 * </tr>
 * <tr>
 * <td></td>
 * <td></td>
 * <td>
 * permSOMWMIFullControl
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * WMI filter
 * 
 * </td>
 * <td>
 * Editing WMI filters
 * 
 * </td>
 * <td>
 * permWMIFilterEdit
 * 
 * </td>
 * </tr>
 * <tr>
 * <td></td>
 * <td>
 * Full control of all WMI filters
 * 
 * </td>
 * <td>
 * permWMIFilterFullControl
 * 
 * </td>
 * </tr>
 * <tr>
 * <td></td>
 * <td>
 * Custom control of WMI filters
 * 
 * </td>
 * <td>
 * permWMIFilterCustom
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * GPO
 * 
 * </td>
 * <td>
 * Security filtering
 * 
 * </td>
 * <td>
 * permGPOApply
 * 
 * </td>
 * </tr>
 * <tr>
 * <td></td>
 * <td>
 * Delegation
 * 
 * </td>
 * <td>
 * permGPORead
 * 
 * </td>
 * </tr>
 * <tr>
 * <td></td>
 * <td></td>
 * <td>
 * permGPOEdit
 * 
 * </td>
 * </tr>
 * <tr>
 * <td></td>
 * <td></td>
 * <td>
 * permGPOEditSecurityAndDelete
 * 
 * </td>
 * </tr>
 * <tr>
 * <td></td>
 * <td></td>
 * <td>
 * permGPOCustom
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * Starter GPO
 * 
 * </td>
 * <td>
 * Delegation
 * 
 * </td>
 * <td>
 * permStarterGPORead
 * 
 * </td>
 * </tr>
 * <tr>
 * <td></td>
 * <td></td>
 * <td>
 * permStarterGPOEdit
 * 
 * </td>
 * </tr>
 * <tr>
 * <td></td>
 * <td></td>
 * <td>
 * permStarterGPOFullControl
 * 
 * </td>
 * </tr>
 * <tr>
 * <td></td>
 * <td></td>
 * <td>
 * permStarterGPOCustom
 * 
 * </td>
 * </tr>
 * <tr>
 * <td></td>
 * <td></td>
 * <td>
 * permSOMStarterGPOCreate
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * For more information about predefined policy-related permissions, see 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpm-createpermission">IGPM::CreatePermission</a> (<b>GPM.CreatePermission</b>).
 * 
 * For more information about security groups, see 
 * <a href="https://docs.microsoft.com/windows/desktop/AD/how-security-groups-are-used-in-access-control">How Security Groups are Used in Access Control</a> in the Active Directory Programmer's Guide.
 * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nn-gpmgmt-igpmpermission
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class GPMPermission extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
