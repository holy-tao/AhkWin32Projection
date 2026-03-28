#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VDS_ISCSI_PORTAL_PROP.ahk
#Include .\IVdsSubSystem.ahk
#Include .\IEnumVdsObject.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVdsIscsiPortal interface (vdshwprv.h) provides methods for performing query and configuration operations on an iSCSI portal.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nn-vdshwprv-ivdsiscsiportal
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsIscsiPortal extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsIscsiPortal
     * @type {Guid}
     */
    static IID => Guid("{7fa1499d-ec85-4a8a-a47b-ff69201fcd34}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProperties", "GetSubSystem", "QueryAssociatedPortalGroups", "SetStatus", "SetIpsecTunnelAddress", "GetIpsecSecurity", "SetIpsecSecurity"]

    /**
     * The IVdsIscsiPortal::GetProperties (vdshwprv.h) method returns the properties of a portal.
     * @returns {VDS_ISCSI_PORTAL_PROP} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_iscsi_portal_prop">VDS_ISCSI_PORTAL_PROP</a> structure.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsiscsiportal-getproperties
     */
    GetProperties() {
        pPortalProp := VDS_ISCSI_PORTAL_PROP()
        result := ComCall(3, this, "ptr", pPortalProp, "HRESULT")
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
     * @param {Integer} _status 
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
        result := ComCall(6, this, "int", _status, "HRESULT")
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
        result := ComCall(7, this, "ptr", pTunnelAddress, "ptr", pDestinationAddress, "HRESULT")
        return result
    }

    /**
     * The IVdsIscsiPortal::GetIpsecSecurity (vdshwprv.h) method is not supported but is reserved for future use.
     * @param {Pointer<VDS_IPADDRESS>} pInitiatorPortalAddress Reserved for future use.
     * @returns {Integer} Reserved for future use.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsiscsiportal-getipsecsecurity
     */
    GetIpsecSecurity(pInitiatorPortalAddress) {
        result := ComCall(8, this, "ptr", pInitiatorPortalAddress, "uint*", &pullSecurityFlags := 0, "HRESULT")
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
        result := ComCall(9, this, "ptr", pInitiatorPortalAddress, "uint", ullSecurityFlags, "ptr", pIpsecKey, "HRESULT")
        return result
    }
}
