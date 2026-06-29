#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\VDS_ISCSI_IPSEC_KEY.ahk" { VDS_ISCSI_IPSEC_KEY }
#Import ".\VDS_IPADDRESS.ahk" { VDS_IPADDRESS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IVdsIscsiInitiatorAdapter.ahk" { IVdsIscsiInitiatorAdapter }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\VDS_ISCSI_INITIATOR_PORTAL_PROP.ahk" { VDS_ISCSI_INITIATOR_PORTAL_PROP }

/**
 * Provides methods to query and interact with iSCSI initiator portals on the local system.
 * @see https://learn.microsoft.com/windows/win32/api/vds/nn-vds-ivdsiscsiinitiatorportal
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct IVdsIscsiInitiatorPortal extends IUnknown {
    /**
     * The interface identifier for IVdsIscsiInitiatorPortal
     * @type {Guid}
     */
    static IID := Guid("{38a0a9ab-7cc8-4693-ac07-1f28bd03c3da}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVdsIscsiInitiatorPortal interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetProperties         : IntPtr
        GetInitiatorAdapter   : IntPtr
        SetIpsecTunnelAddress : IntPtr
        GetIpsecSecurity      : IntPtr
        SetIpsecSecurity      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVdsIscsiInitiatorPortal.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns the properties of an initiator portal.
     * @returns {VDS_ISCSI_INITIATOR_PORTAL_PROP} The address of a 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_iscsi_initiator_portal_prop">VDS_ISCSI_INITIATOR_PORTAL_PROP</a> 
     *       structure allocated by the caller.
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsiscsiinitiatorportal-getproperties
     */
    GetProperties() {
        pInitiatorPortalProp := VDS_ISCSI_INITIATOR_PORTAL_PROP()
        result := ComCall(3, this, VDS_ISCSI_INITIATOR_PORTAL_PROP.Ptr, pInitiatorPortalProp, "HRESULT")
        return pInitiatorPortalProp
    }

    /**
     * Returns the initiator adapter to which the initiator portal belongs.
     * @returns {IVdsIscsiInitiatorAdapter} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vds/nn-vds-ivdsiscsiinitiatoradapter">IVdsIscsiInitiatorAdapter</a> 
     *       interface pointer. VDS initializes the interface on return. Callers must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsiscsiinitiatorportal-getinitiatoradapter
     */
    GetInitiatorAdapter() {
        result := ComCall(4, this, "ptr*", &ppInitiatorAdapter := 0, "HRESULT")
        return IVdsIscsiInitiatorAdapter(ppInitiatorAdapter)
    }

    /**
     * Not supported.This method is reserved for future use. (IVdsIscsiInitiatorPortal.SetIpsecTunnelAddress)
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
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsiscsiinitiatorportal-setipsectunneladdress
     */
    SetIpsecTunnelAddress(pTunnelAddress, pDestinationAddress) {
        result := ComCall(5, this, VDS_IPADDRESS.Ptr, pTunnelAddress, VDS_IPADDRESS.Ptr, pDestinationAddress, "HRESULT")
        return result
    }

    /**
     * Not supported.This method is reserved for future use. (IVdsIscsiInitiatorPortal.GetIpsecSecurity)
     * @param {Guid} targetPortalId Reserved for future use.
     * @returns {Integer} Reserved for future use.
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsiscsiinitiatorportal-getipsecsecurity
     */
    GetIpsecSecurity(targetPortalId) {
        result := ComCall(6, this, Guid, targetPortalId, "uint*", &pullSecurityFlags := 0, "HRESULT")
        return pullSecurityFlags
    }

    /**
     * Not supported.This method is reserved for future use. (IVdsIscsiInitiatorPortal.SetIpsecSecurity)
     * @param {Guid} targetPortalId Reserved for future use.
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
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsiscsiinitiatorportal-setipsecsecurity
     */
    SetIpsecSecurity(targetPortalId, ullSecurityFlags, pIpsecKey) {
        result := ComCall(7, this, Guid, targetPortalId, "uint", ullSecurityFlags, VDS_ISCSI_IPSEC_KEY.Ptr, pIpsecKey, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVdsIscsiInitiatorPortal.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetProperties := CallbackCreate(GetMethod(implObj, "GetProperties"), flags, 2)
        this.vtbl.GetInitiatorAdapter := CallbackCreate(GetMethod(implObj, "GetInitiatorAdapter"), flags, 2)
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
        CallbackFree(this.vtbl.GetInitiatorAdapter)
        CallbackFree(this.vtbl.SetIpsecTunnelAddress)
        CallbackFree(this.vtbl.GetIpsecSecurity)
        CallbackFree(this.vtbl.SetIpsecSecurity)
    }
}
