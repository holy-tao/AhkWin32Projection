#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\VDS_ISCSI_IPSEC_KEY.ahk" { VDS_ISCSI_IPSEC_KEY }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\VDS_IPADDRESS.ahk" { VDS_IPADDRESS }
#Import ".\VDS_ISCSI_SHARED_SECRET.ahk" { VDS_ISCSI_SHARED_SECRET }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IEnumVdsObject.ahk" { IEnumVdsObject }

/**
 * Provides methods to interface with the local initiator service, including the ability to set CHAP security settings and to log into targets.
 * @see https://learn.microsoft.com/windows/win32/api/vds/nn-vds-ivdsserviceiscsi
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct IVdsServiceIscsi extends IUnknown {
    /**
     * The interface identifier for IVdsServiceIscsi
     * @type {Guid}
     */
    static IID := Guid("{14fbe036-3ed7-4e10-90e9-a5ff991aff01}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVdsServiceIscsi interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetInitiatorName           : IntPtr
        QueryInitiatorAdapters     : IntPtr
        SetIpsecGroupPresharedKey  : IntPtr
        SetAllIpsecTunnelAddresses : IntPtr
        SetAllIpsecSecurity        : IntPtr
        SetInitiatorSharedSecret   : IntPtr
        RememberTargetSharedSecret : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVdsServiceIscsi.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns the iSCSI name of the local initiator service.
     * @returns {PWSTR} The address of a pointer to a string. VDS will put a pointer to an initialized string at this location. 
     *       Callers must free the string by using the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsserviceiscsi-getinitiatorname
     */
    GetInitiatorName() {
        result := ComCall(3, this, PWSTR.Ptr, &ppwszIscsiName := 0, "HRESULT")
        return ppwszIscsiName
    }

    /**
     * Returns an object that enumerates the iSCSI initiator adapters of the initiator.
     * @returns {IEnumVdsObject} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ienumvdsobject">IEnumVdsObject</a> interface pointer that can be used to enumerate the  initiator adapters  as <a href="https://docs.microsoft.com/windows/desktop/VDS/startup-and-service-objects">initiator adapter objects</a>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/VDS/working-with-enumeration-objects">Working with Enumeration Objects</a>. Callers must release the interface and each of the initiator adapter objects when they are no longer needed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsserviceiscsi-queryinitiatoradapters
     */
    QueryInitiatorAdapters() {
        result := ComCall(4, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumVdsObject(ppEnum)
    }

    /**
     * Not supported.This method is reserved for future use. (IVdsServiceIscsi.SetIpsecGroupPresharedKey)
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
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsserviceiscsi-setipsecgrouppresharedkey
     */
    SetIpsecGroupPresharedKey(pIpsecKey) {
        result := ComCall(5, this, VDS_ISCSI_IPSEC_KEY.Ptr, pIpsecKey, "HRESULT")
        return result
    }

    /**
     * Not supported.This method is reserved for future use. (IVdsServiceIscsi.SetAllIpsecTunnelAddresses)
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
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsserviceiscsi-setallipsectunneladdresses
     */
    SetAllIpsecTunnelAddresses(pTunnelAddress, pDestinationAddress) {
        result := ComCall(6, this, VDS_IPADDRESS.Ptr, pTunnelAddress, VDS_IPADDRESS.Ptr, pDestinationAddress, "HRESULT")
        return result
    }

    /**
     * Not supported. (IVdsServiceIscsi.SetAllIpsecSecurity)
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
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsserviceiscsi-setallipsecsecurity
     */
    SetAllIpsecSecurity(targetPortalId, ullSecurityFlags, pIpsecKey) {
        result := ComCall(7, this, Guid, targetPortalId, "uint", ullSecurityFlags, VDS_ISCSI_IPSEC_KEY.Ptr, pIpsecKey, "HRESULT")
        return result
    }

    /**
     * Sets the initiator CHAP shared secret that is used for mutual CHAP authentication when the initiator authenticates the target.
     * @remarks
     * An initiator may support setting a different CHAP shared secret for each target.
     * 
     * There is no way to determine programmatically whether an initiator   supports target-specific secrets. If the call to <b>SetInitiatorSharedSecret</b> returns VDS_E_TARGET_SPECIFIC_NOT_SUPPORTED, call the method again, setting the <i>targetId</i> parameter to GUID_NULL.
     * 
     * The Microsoft iSCSI Software Initiator does not support setting target-specific secrets.
     * @param {Pointer<VDS_ISCSI_SHARED_SECRET>} pInitiatorSharedSecret The address of a <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_iscsi_shared_secret">VDS_ISCSI_SHARED_SECRET</a> 
     *       structure that contains the shared secret. If the <b>pSharedSecret</b> member  is <b>NULL</b> and the <b>ulSharedSecretSize</b> is zero, the <b>SetInitiatorSharedSecret</b> method  clears   any existing secret. If this parameter is <b>NULL</b> and the <i>targetId</i> 
     *       parameter is not <b>GUID_NULL</b>, <b>SetInitiatorSharedSecret</b> clears the association between the initiator and the target.
     * @param {Guid} targetId The <b>VDS_OBJECT_ID</b> of the target. This parameter is set to 
     *       <b>GUID_NULL</b> if the shared secret is not to be target-specific.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="https://docs.microsoft.com/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="https://docs.microsoft.com/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The shared secret  was set successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_INITIALIZED_FAILED</b></dt>
     * <dt>0x80042401L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * VDS failed to initialize. If an application calls this method before the service finishes initializing, 
     *         the method is blocked until the initialization completes. If the initialization fails, this error is returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_TARGET_SPECIFIC_NOT_SUPPORTED</b></dt>
     * <dt>0x80042706L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The initiator service does not support setting target-specific shared secrets.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsserviceiscsi-setinitiatorsharedsecret
     */
    SetInitiatorSharedSecret(pInitiatorSharedSecret, targetId) {
        result := ComCall(8, this, VDS_ISCSI_SHARED_SECRET.Ptr, pInitiatorSharedSecret, Guid, targetId, "HRESULT")
        return result
    }

    /**
     * Communicates the CHAP shared secret of a target to the initiator service. This shared secret is used during target login when the target authenticates the initiator.
     * @param {Guid} targetId The <b>VDS_OBJECT_ID</b> of the target that has the specified shared secret. This parameter is required and cannot be GUID_NULL.
     * @param {Pointer<VDS_ISCSI_SHARED_SECRET>} pTargetSharedSecret The address of a <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_iscsi_shared_secret">VDS_ISCSI_SHARED_SECRET</a> structure 
     *       that contains the CHAP shared secret.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="https://docs.microsoft.com/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="https://docs.microsoft.com/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="https://docs.microsoft.com/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The shared secret  was remembered successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VDS_E_INITIALIZED_FAILED</b></dt>
     * <dt>0x80042401L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * VDS failed to initialize. If an application calls this method before the service finishes initializing, the 
     *         method is blocked until the initialization completes. If the initialization fails, this error is returned.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsserviceiscsi-remembertargetsharedsecret
     */
    RememberTargetSharedSecret(targetId, pTargetSharedSecret) {
        result := ComCall(9, this, Guid, targetId, VDS_ISCSI_SHARED_SECRET.Ptr, pTargetSharedSecret, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVdsServiceIscsi.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetInitiatorName := CallbackCreate(GetMethod(implObj, "GetInitiatorName"), flags, 2)
        this.vtbl.QueryInitiatorAdapters := CallbackCreate(GetMethod(implObj, "QueryInitiatorAdapters"), flags, 2)
        this.vtbl.SetIpsecGroupPresharedKey := CallbackCreate(GetMethod(implObj, "SetIpsecGroupPresharedKey"), flags, 2)
        this.vtbl.SetAllIpsecTunnelAddresses := CallbackCreate(GetMethod(implObj, "SetAllIpsecTunnelAddresses"), flags, 3)
        this.vtbl.SetAllIpsecSecurity := CallbackCreate(GetMethod(implObj, "SetAllIpsecSecurity"), flags, 4)
        this.vtbl.SetInitiatorSharedSecret := CallbackCreate(GetMethod(implObj, "SetInitiatorSharedSecret"), flags, 3)
        this.vtbl.RememberTargetSharedSecret := CallbackCreate(GetMethod(implObj, "RememberTargetSharedSecret"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetInitiatorName)
        CallbackFree(this.vtbl.QueryInitiatorAdapters)
        CallbackFree(this.vtbl.SetIpsecGroupPresharedKey)
        CallbackFree(this.vtbl.SetAllIpsecTunnelAddresses)
        CallbackFree(this.vtbl.SetAllIpsecSecurity)
        CallbackFree(this.vtbl.SetInitiatorSharedSecret)
        CallbackFree(this.vtbl.RememberTargetSharedSecret)
    }
}
