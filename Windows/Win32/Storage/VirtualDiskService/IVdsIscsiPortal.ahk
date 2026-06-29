#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\VDS_ISCSI_PORTAL_PROP.ahk" { VDS_ISCSI_PORTAL_PROP }
#Import ".\VDS_ISCSI_IPSEC_KEY.ahk" { VDS_ISCSI_IPSEC_KEY }
#Import ".\VDS_IPADDRESS.ahk" { VDS_IPADDRESS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IVdsSubSystem.ahk" { IVdsSubSystem }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\VDS_ISCSI_PORTAL_STATUS.ahk" { VDS_ISCSI_PORTAL_STATUS }
#Import ".\IEnumVdsObject.ahk" { IEnumVdsObject }

/**
 * The IVdsIscsiPortal interface (vdshwprv.h) provides methods for performing query and configuration operations on an iSCSI portal.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nn-vdshwprv-ivdsiscsiportal
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct IVdsIscsiPortal extends IUnknown {
    /**
     * The interface identifier for IVdsIscsiPortal
     * @type {Guid}
     */
    static IID := Guid("{7fa1499d-ec85-4a8a-a47b-ff69201fcd34}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVdsIscsiPortal interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetProperties               : IntPtr
        GetSubSystem                : IntPtr
        QueryAssociatedPortalGroups : IntPtr
        SetStatus                   : IntPtr
        SetIpsecTunnelAddress       : IntPtr
        GetIpsecSecurity            : IntPtr
        SetIpsecSecurity            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVdsIscsiPortal.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IVdsIscsiPortal::GetProperties (vdshwprv.h) method returns the properties of a portal.
     * @returns {VDS_ISCSI_PORTAL_PROP} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_iscsi_portal_prop">VDS_ISCSI_PORTAL_PROP</a> structure.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsiscsiportal-getproperties
     */
    GetProperties() {
        pPortalProp := VDS_ISCSI_PORTAL_PROP()
        result := ComCall(3, this, VDS_ISCSI_PORTAL_PROP.Ptr, pPortalProp, "HRESULT")
        return pPortalProp
    }

    /**
     * The IVdsIscsiPortal::GetSubSystem (vdshwprv.h) method returns the subsystem to which the portal belongs.
     * @returns {IVdsSubSystem} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ivdssubsystem">IVdsSubSystem</a> interface pointer. 
     *       Callers must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsiscsiportal-getsubsystem
     */
    GetSubSystem() {
        result := ComCall(4, this, "ptr*", &ppSubSystem := 0, "HRESULT")
        return IVdsSubSystem(ppSubSystem)
    }

    /**
     * The IVdsIscsiPortal::QueryAssociatedPortalGroups (vdshwprv.h) method returns an enumeration of the portal groups with which the portal is associated.
     * @returns {IEnumVdsObject} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ienumvdsobject">IEnumVdsObject</a> interface pointer that can be used to enumerate the portal groups  as <a href="https://docs.microsoft.com/windows/desktop/VDS/portal-group-object">portal group objects</a>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/VDS/working-with-enumeration-objects">Working with Enumeration Objects</a>. Callers must release the interface and each of the portal  group objects when they are no longer needed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsiscsiportal-queryassociatedportalgroups
     */
    QueryAssociatedPortalGroups() {
        result := ComCall(5, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumVdsObject(ppEnum)
    }

    /**
     * The IVdsIscsiPortal::SetStatus (vdshwprv.h) method sets the status of a portal to the specified value.
     * @param {VDS_ISCSI_PORTAL_STATUS} _status Values enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_iscsi_portal_status">VDS_ISCSI_PORTAL_STATUS</a>. 
     *       Only <b>VDS_IPS_ONLINE</b> and <b>VDS_IPS_OFFLINE</b> enumeration values 
     *       are supported; the remaining values are only to be used by a provider to report status.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="https://docs.microsoft.com/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="https://docs.microsoft.com/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The status  was set successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_E_PROVIDER_CACHE_CORRUPT</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The cache of the provider is corrupted. This indicates a software or communication problem inside a 
     *         provider that caches information about the attached devices. The caller can use the 
     *         <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-reenumerate">IVdsHwProvider::Reenumerate</a> method 
     *         followed by the  <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwprovider-refresh">IVdsHwProvider::Refresh</a> 
     *         method to restore the cache.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_E_OBJECT_DELETED</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The portal object is no longer present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_E_ANOTHER_CALL_IN_PROGRESS</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Another operation is in progress. This operation cannot proceed until the previous operations are complete.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_E_NOT_SUPPORTED</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation or combination of parameters is not supported by this provider.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsiscsiportal-setstatus
     */
    SetStatus(_status) {
        result := ComCall(6, this, VDS_ISCSI_PORTAL_STATUS, _status, "HRESULT")
        return result
    }

    /**
     * The IVdsIscsiPortal::SetIpsecTunnelAddress (vdshwprv.h) method is not supported and is reserved for future use.
     * @param {Pointer<VDS_IPADDRESS>} pTunnelAddress Reserved for future use.
     * @param {Pointer<VDS_IPADDRESS>} pDestinationAddress Reserved for future use.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_E_NOT_SUPPORTED</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method is not supported in this release.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsiscsiportal-setipsectunneladdress
     */
    SetIpsecTunnelAddress(pTunnelAddress, pDestinationAddress) {
        result := ComCall(7, this, VDS_IPADDRESS.Ptr, pTunnelAddress, VDS_IPADDRESS.Ptr, pDestinationAddress, "HRESULT")
        return result
    }

    /**
     * The IVdsIscsiPortal::GetIpsecSecurity (vdshwprv.h) method is not supported but is reserved for future use.
     * @param {Pointer<VDS_IPADDRESS>} pInitiatorPortalAddress Reserved for future use.
     * @returns {Integer} Reserved for future use.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsiscsiportal-getipsecsecurity
     */
    GetIpsecSecurity(pInitiatorPortalAddress) {
        result := ComCall(8, this, VDS_IPADDRESS.Ptr, pInitiatorPortalAddress, "uint*", &pullSecurityFlags := 0, "HRESULT")
        return pullSecurityFlags
    }

    /**
     * The IVdsIscsiPortal::SetIpsecSecurity (vdshwprv.h) method is not supported and is reserved for future use.
     * @param {Pointer<VDS_IPADDRESS>} pInitiatorPortalAddress Reserved for future use.
     * @param {Integer} ullSecurityFlags Reserved for future use.
     * @param {Pointer<VDS_ISCSI_IPSEC_KEY>} pIpsecKey Reserved for future use.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>VDS_E_NOT_SUPPORTED</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method is not supported in this release.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsiscsiportal-setipsecsecurity
     */
    SetIpsecSecurity(pInitiatorPortalAddress, ullSecurityFlags, pIpsecKey) {
        result := ComCall(9, this, VDS_IPADDRESS.Ptr, pInitiatorPortalAddress, "uint", ullSecurityFlags, VDS_ISCSI_IPSEC_KEY.Ptr, pIpsecKey, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVdsIscsiPortal.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetProperties := CallbackCreate(GetMethod(implObj, "GetProperties"), flags, 2)
        this.vtbl.GetSubSystem := CallbackCreate(GetMethod(implObj, "GetSubSystem"), flags, 2)
        this.vtbl.QueryAssociatedPortalGroups := CallbackCreate(GetMethod(implObj, "QueryAssociatedPortalGroups"), flags, 2)
        this.vtbl.SetStatus := CallbackCreate(GetMethod(implObj, "SetStatus"), flags, 2)
        this.vtbl.SetIpsecTunnelAddress := CallbackCreate(GetMethod(implObj, "SetIpsecTunnelAddress"), flags, 3)
        this.vtbl.GetIpsecSecurity := CallbackCreate(GetMethod(implObj, "GetIpsecSecurity"), flags, 3)
        this.vtbl.SetIpsecSecurity := CallbackCreate(GetMethod(implObj, "SetIpsecSecurity"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetProperties)
        CallbackFree(this.vtbl.GetSubSystem)
        CallbackFree(this.vtbl.QueryAssociatedPortalGroups)
        CallbackFree(this.vtbl.SetStatus)
        CallbackFree(this.vtbl.SetIpsecTunnelAddress)
        CallbackFree(this.vtbl.GetIpsecSecurity)
        CallbackFree(this.vtbl.SetIpsecSecurity)
    }
}
