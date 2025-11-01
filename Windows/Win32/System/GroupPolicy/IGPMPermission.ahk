#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IGPMPermission interface contains methods to retrieve permission-related properties when using the GPMC.
 * @remarks
 * 
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
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nn-gpmgmt-igpmpermission
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPMPermission extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGPMPermission
     * @type {Guid}
     */
    static IID => Guid("{35ebca40-e1a1-4a02-8905-d79416fb464a}")

    /**
     * The class identifier for GPMPermission
     * @type {Guid}
     */
    static CLSID => Guid("{5871a40a-e9c0-46ec-913e-944ef9225a94}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Inherited", "get_Inheritable", "get_Denied", "get_Permission", "get_Trustee"]

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pVal 
     * @returns {HRESULT} 
     */
    get_Inherited(pVal) {
        result := ComCall(7, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pVal 
     * @returns {HRESULT} 
     */
    get_Inheritable(pVal) {
        result := ComCall(8, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pVal 
     * @returns {HRESULT} 
     */
    get_Denied(pVal) {
        result := ComCall(9, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_Permission(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IGPMTrustee>} ppIGPMTrustee 
     * @returns {HRESULT} 
     */
    get_Trustee(ppIGPMTrustee) {
        result := ComCall(11, this, "ptr*", ppIGPMTrustee, "HRESULT")
        return result
    }
}
