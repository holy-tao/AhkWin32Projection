#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\Ole\IEnumVARIANT.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IGPMSecurityInfo interface defines the methods of the GPMSecurityInfo collection. This collection represents a set of policy-related permissions that can be set on a particular object, such as a scope of management (SOM), a GPO, or a WMI filter.
 * @remarks
 * 
  * The interface divides the policy-related permissions into categories. The following table lists the categories, 
  *      permissions included in the categories, and the object to which they can be applied.
  * 
  * <table>
  * <tr>
  * <th>Securable object</th>
  * <th>Permission category</th>
  * <th>Permission level</th>
  * </tr>
  * <tr>
  * <td>Site</td>
  * <td>GPO linking</td>
  * <td>permSOMLink</td>
  * </tr>
  * <tr>
  * <td>OU</td>
  * <td>GPO linking</td>
  * <td>permSOMLink</td>
  * </tr>
  * <tr>
  * <td></td>
  * <td>RSoP logging</td>
  * <td>permSOMLogging</td>
  * </tr>
  * <tr>
  * <td></td>
  * <td>RSoP planning</td>
  * <td>permSOMPlanning</td>
  * </tr>
  * <tr>
  * <td>Domain</td>
  * <td>GPO linking</td>
  * <td>permSOMLink</td>
  * </tr>
  * <tr>
  * <td></td>
  * <td>Creating GPOs</td>
  * <td>permSOMGPOCreate</td>
  * </tr>
  * <tr>
  * <td></td>
  * <td>RSoP logging</td>
  * <td>permSOMLogging</td>
  * </tr>
  * <tr>
  * <td></td>
  * <td>RSoP planning</td>
  * <td>permSOMPlanning</td>
  * </tr>
  * <tr>
  * <td></td>
  * <td>Creating WMI filters</td>
  * <td>permSOMWMICreate</td>
  * </tr>
  * <tr>
  * <td></td>
  * <td></td>
  * <td>permSOMWMIFullControl</td>
  * </tr>
  * <tr>
  * <td>WMI filter</td>
  * <td>Editing WMI filters</td>
  * <td>permWMIFilterEdit</td>
  * </tr>
  * <tr>
  * <td></td>
  * <td>Full control of all WMI filters</td>
  * <td>permWMIFilterFullControl</td>
  * </tr>
  * <tr>
  * <td></td>
  * <td>Custom control of WMI filters</td>
  * <td>permWMIFilterCustom</td>
  * </tr>
  * <tr>
  * <td>GPO</td>
  * <td>Security filtering</td>
  * <td>permGPOApply</td>
  * </tr>
  * <tr>
  * <td></td>
  * <td>Delegation</td>
  * <td>permGPORead</td>
  * </tr>
  * <tr>
  * <td></td>
  * <td></td>
  * <td>permGPOEdit</td>
  * </tr>
  * <tr>
  * <td></td>
  * <td></td>
  * <td>permGPOEditSecurityAndDelete</td>
  * </tr>
  * <tr>
  * <td></td>
  * <td></td>
  * <td>permGPOCustom</td>
  * </tr>
  * </table>
  *  
  * 
  * The <b>GPMSecurityInfo</b> collection represents a 
  *     collection of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmpermission">GPMPermission</a> objects for a particular SOM, 
  *     GPO, or WMI filter. Note however, that although the 
  *     <b>GPMSecurityInfo</b> object is a collection object, it is not 
  *     a typical collection object. This is because no action occurs if the 
  *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpmsecurityinfo-add">Add</a> method attempts to add a 
  *     <b>GPMPermission</b> object for a trustee and the permission is 
  *     below the level of an existing permission for that trustee. For more information, see the 
  *     <b>Add</b> method.
  * 
  * For more information about policy-related permissions, see 
  *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpm-createpermission">IGPM::CreatePermission</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nn-gpmgmt-igpmsecurityinfo
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPMSecurityInfo extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGPMSecurityInfo
     * @type {Guid}
     */
    static IID => Guid("{b6c31ed4-1c93-4d3e-ae84-eb6d61161b60}")

    /**
     * The class identifier for GPMSecurityInfo
     * @type {Guid}
     */
    static CLSID => Guid("{547a5e8f-9162-4516-a4df-9ddb9686d846}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get_Item", "get__NewEnum", "Add", "Remove", "RemoveTrustee"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmsecurityinfo-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmsecurityinfo-get_item
     */
    get_Item(lIndex) {
        pVal := VARIANT()
        result := ComCall(8, this, "int", lIndex, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {IEnumVARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmsecurityinfo-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumVARIANT(ppEnum)
    }

    /**
     * 
     * @param {IGPMPermission} pPerm 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmsecurityinfo-add
     */
    Add(pPerm) {
        result := ComCall(10, this, "ptr", pPerm, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IGPMPermission} pPerm 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmsecurityinfo-remove
     */
    Remove(pPerm) {
        result := ComCall(11, this, "ptr", pPerm, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrTrustee 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmsecurityinfo-removetrustee
     */
    RemoveTrustee(bstrTrustee) {
        bstrTrustee := bstrTrustee is String ? BSTR.Alloc(bstrTrustee).Value : bstrTrustee

        result := ComCall(12, this, "ptr", bstrTrustee, "HRESULT")
        return result
    }
}
