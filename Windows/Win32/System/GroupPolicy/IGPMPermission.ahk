#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\IGPMTrustee.ahk" { IGPMTrustee }
#Import ".\GPMPermissionType.ahk" { GPMPermissionType }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

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
 */
export default struct IGPMPermission extends IDispatch {
    /**
     * The interface identifier for IGPMPermission
     * @type {Guid}
     */
    static IID := Guid("{35ebca40-e1a1-4a02-8905-d79416fb464a}")

    /**
     * The class identifier for GPMPermission
     * @type {Guid}
     */
    static CLSID := Guid("{5871a40a-e9c0-46ec-913e-944ef9225a94}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGPMPermission interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Inherited   : IntPtr
        get_Inheritable : IntPtr
        get_Denied      : IntPtr
        get_Permission  : IntPtr
        get_Trustee     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGPMPermission.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Inherited {
        get => this.get_Inherited()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Inheritable {
        get => this.get_Inheritable()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Denied {
        get => this.get_Denied()
    }

    /**
     * @type {GPMPermissionType} 
     */
    Permission {
        get => this.get_Permission()
    }

    /**
     * @type {IGPMTrustee} 
     */
    Trustee {
        get => this.get_Trustee()
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_Inherited() {
        result := ComCall(7, this, VARIANT_BOOL.Ptr, &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_Inheritable() {
        result := ComCall(8, this, VARIANT_BOOL.Ptr, &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_Denied() {
        result := ComCall(9, this, VARIANT_BOOL.Ptr, &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {GPMPermissionType} 
     */
    get_Permission() {
        result := ComCall(10, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {IGPMTrustee} 
     */
    get_Trustee() {
        result := ComCall(11, this, "ptr*", &ppIGPMTrustee := 0, "HRESULT")
        return IGPMTrustee(ppIGPMTrustee)
    }

    Query(iid) {
        if (IGPMPermission.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Inherited := CallbackCreate(GetMethod(implObj, "get_Inherited"), flags, 2)
        this.vtbl.get_Inheritable := CallbackCreate(GetMethod(implObj, "get_Inheritable"), flags, 2)
        this.vtbl.get_Denied := CallbackCreate(GetMethod(implObj, "get_Denied"), flags, 2)
        this.vtbl.get_Permission := CallbackCreate(GetMethod(implObj, "get_Permission"), flags, 2)
        this.vtbl.get_Trustee := CallbackCreate(GetMethod(implObj, "get_Trustee"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Inherited)
        CallbackFree(this.vtbl.get_Inheritable)
        CallbackFree(this.vtbl.get_Denied)
        CallbackFree(this.vtbl.get_Permission)
        CallbackFree(this.vtbl.get_Trustee)
    }
}
