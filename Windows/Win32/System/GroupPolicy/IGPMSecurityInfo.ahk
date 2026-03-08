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
 * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nn-gpmgmt-igpmsecurityinfo
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
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IEnumVARIANT} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * Returns the number of GPMPermission objects in the collection.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmsecurityinfo-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Given an index, returns a GPMPermission object from the collection.
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
     * Retrieves an enumerator for the collection. (IGPMSecurityInfo.get__NewEnum)
     * @returns {IEnumVARIANT} Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-ienumvariant">IEnumVARIANT</a> interface of an enumerator object for the collection. <b>IEnumVARIANT</b> provides a number of methods that you can use to iterate through the collection.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmsecurityinfo-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumVARIANT(ppEnum)
    }

    /**
     * Adds the permission specified in a GPMPermission object to the GPMSecurityInfo collection. You can add a permission that is above the level of existing permissions. For more information about restrictions that apply, see the following Remarks section.
     * @remarks
     * A trustee is a user, computer, or security group that can be granted permissions on a GPO, SOM, or WMI filter.
     * 
     * Note that there can be some overlap of the permission levels that apply to a given object. Instances include the following:
     * 
     * <ul>
     * <li>permGPOEditSecurity is a superset of permGPOEdit, which is a superset of permGPORead</li>
     * <li>permGPOApply is a superset of permGPORead</li>
     * <li>permWMIFilterFullControl is a superset of permWMIFilterEdit</li>
     * <li>permSOMWMIFullControl is a superset of permSOMWMICreate</li>
     * </ul>
     * If a permission that you are adding for a trustee overlaps (as defined above) with an existing permission that already exists on the object, the following rules apply:
     * 
     * <ol>
     * <li>If there is an Inherited permission on the object, you cannot add a higher level permission for the user. This is because an Inherited permission cannot be modified. The permission must first be removed from the parent container before a change can be made to the Inherited permission.</li>
     * <li>If there is a Denied permission on the object, you cannot add a higher level permission to the existing permission for the user.</li>
     * <li>If there is a permission that is explicitly set on the object, adding a lower level permission does not change the user's permissions. In addition, the method returns S_FALSE, which can be tested for by the calling application.</li>
     * <li>If there is a permission that is explicitly set on the object, adding a higher level permission changes the user's permissions.</li>
     * <li>Because permGPORead is a subset of permGPOEdit and permGPOApply, permGPORead can be removed only if both permGPOEdit and permGPOApply are removed.</li>
     * <li>If the current permission is not inheritable, and the permission you are adding sets the Inheritable property to TRUE, then the permission is changed to be an inheritable one.</li>
     * <li>If the current permission is inheritable, and the permission you are adding sets the Inheritable property to FALSE, the method returns S_FALSE.</li>
     * </ol>
     * Note that you cannot add Denied, Inherited, or custom permissions using the GPMC, but you can add Inheritable permissions. You can delete Denied and custom permissions. If you attempt to add a Denied permission, it results in an error. Custom permissions are those that do not match any of the permission levels defined by the GPMC. For example, if a trustee is granted the "Apply" ACE for a GPO, but not the "Read" ACE, the permission is a custom permission. To determine if a permission is Denied or Inherited you can call the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/gpmc/igpmpermission-property-methods">IGPMPermission Property Methods</a>.
     * 
     * For more information about predefined policy-related permissions, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpm-createpermission">IGPM::CreatePermission</a>. For information about permission categories and levels, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmsecurityinfo">IGPMSecurityInfo</a>.
     * 
     * When adding permissions on a GPO, the value of the Inheritable property is ignored and set to <b>TRUE</b>. This is because all GPO permissions should be inheritable to the User and Computer child containers in the directory service and to subdirectories in the system volume folder (SysVol). When adding permissions on WMI filters, the value of the Inheritable property is always set to <b>FALSE</b>.
     * 
     * For more information about security groups, see 
     * <a href="https://docs.microsoft.com/windows/desktop/AD/how-security-groups-are-used-in-access-control">How Security Groups are Used in Access Control</a> in the Active Directory Programmer's Guide.
     * @param {IGPMPermission} pPerm Pointer to the <b>GPMPermission</b> object to add to the collection.
     * @returns {HRESULT} <h3>JScript</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * 
     * <h3>VB</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmsecurityinfo-add
     */
    Add(pPerm) {
        result := ComCall(10, this, "ptr", pPerm, "HRESULT")
        return result
    }

    /**
     * Removes the permission specified in a given GPMPermission object from the GPMSecurityInfo collection.
     * @remarks
     * You cannot remove Inherited permissions. To determine if a permission is Inherited, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/gpmc/igpmpermission-property-methods">IGPMPermission Property Methods</a>.
     * 
     * The method checks for the existence of the specified <b>GPMPermission</b> object, which is the pairing of a trustee (which is a user, computer, or security group) and a permission that applies to a single object, for example, to a GPO, SOM, or WMI filter. If the object exists in the collection, the method removes it.
     * 
     * If the permission specified for removal represents a higher level than the permission that exists for the trustee, the method removes the lower level permission. An example of this situation is specifying the removal of the permGPOEditSecurityAndDelete permission when the trustee has the lower permGPOEdit permission instead. In this case, the method removes the permGPOEdit permission.
     * 
     * If the permission specified for removal represents a lower level than the permission that exists for the trustee, the method returns S_FALSE.
     * 
     * On successful removal of a permission, the method updates all enumerators returned by the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpmsecurityinfo-get__newenum">get__NewEnum</a> method, even if a removal occurs during the enumeration of elements.
     * 
     * For more information about policy-related permissions, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpm-createpermission">IGPM::CreatePermission</a>.
     * 
     * For more information about security groups, see 
     * <a href="https://docs.microsoft.com/windows/desktop/AD/how-security-groups-are-used-in-access-control">How Security Groups are Used in Access Control</a> in the Active Directory Programmer's Guide.
     * @param {IGPMPermission} pPerm Pointer to the <b>GPMPermission</b> object to remove from the collection.
     * @returns {HRESULT} <h3>JScript</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * 
     * <h3>VB</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmsecurityinfo-remove
     */
    Remove(pPerm) {
        result := ComCall(11, this, "ptr", pPerm, "HRESULT")
        return result
    }

    /**
     * Removes all policy-related permissions for the specified trustee. A trustee is a user, computer, or security group that can be granted permissions on a GPO, SOM, or WMI filter.
     * @remarks
     * On successful removal of a permission, the method updates all enumerators returned by the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpmsecurityinfo-get__newenum">get__NewEnum</a> method, even if a removal occurs during the enumeration of elements.
     * 
     * For more information about policy-related permissions, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpm-createpermission">IGPM::CreatePermission</a>. For more information about security groups, see 
     * <a href="https://docs.microsoft.com/windows/desktop/AD/how-security-groups-are-used-in-access-control">How Security Groups are Used in Access Control</a> in the Active Directory Programmer's Guide.
     * @param {BSTR} bstrTrustee Required. The name or SID of the trustee for which all permissions should be removed. Names are in Security Accounts Manager (SAM) compatible format (Exampledomain\Someone). Use null-terminated string.
     * @returns {HRESULT} <h3>JScript</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * 
     * <h3>VB</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmsecurityinfo-removetrustee
     */
    RemoveTrustee(bstrTrustee) {
        bstrTrustee := bstrTrustee is String ? BSTR.Alloc(bstrTrustee).Value : bstrTrustee

        result := ComCall(12, this, "ptr", bstrTrustee, "HRESULT")
        return result
    }
}
