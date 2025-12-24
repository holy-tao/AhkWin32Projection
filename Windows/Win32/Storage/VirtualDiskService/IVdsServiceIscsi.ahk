#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumVdsObject.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to interface with the local initiator service, including the ability to set CHAP security settings and to log into targets.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsserviceiscsi
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsServiceIscsi extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsServiceIscsi
     * @type {Guid}
     */
    static IID => Guid("{14fbe036-3ed7-4e10-90e9-a5ff991aff01}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetInitiatorName", "QueryInitiatorAdapters", "SetIpsecGroupPresharedKey", "SetAllIpsecTunnelAddresses", "SetAllIpsecSecurity", "SetInitiatorSharedSecret", "RememberTargetSharedSecret"]

    /**
     * Returns the iSCSI name of the local initiator service.
     * @returns {PWSTR} The address of a pointer to a string. VDS will put a pointer to an initialized string at this location. 
     *       Callers must free the string by using the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsserviceiscsi-getinitiatorname
     */
    GetInitiatorName() {
        result := ComCall(3, this, "ptr*", &ppwszIscsiName := 0, "HRESULT")
        return ppwszIscsiName
    }

    /**
     * Returns an object that enumerates the iSCSI initiator adapters of the initiator.
     * @returns {IEnumVdsObject} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ienumvdsobject">IEnumVdsObject</a> interface pointer that can be used to enumerate the  initiator adapters  as <a href="https://docs.microsoft.com/windows/desktop/VDS/startup-and-service-objects">initiator adapter objects</a>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/VDS/working-with-enumeration-objects">Working with Enumeration Objects</a>. Callers must release the interface and each of the initiator adapter objects when they are no longer needed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsserviceiscsi-queryinitiatoradapters
     */
    QueryInitiatorAdapters() {
        result := ComCall(4, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumVdsObject(ppEnum)
    }

    /**
     * Not supported.This method is reserved for future use.
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
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsserviceiscsi-setipsecgrouppresharedkey
     */
    SetIpsecGroupPresharedKey(pIpsecKey) {
        result := ComCall(5, this, "ptr", pIpsecKey, "HRESULT")
        return result
    }

    /**
     * Not supported.This method is reserved for future use.
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
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsserviceiscsi-setallipsectunneladdresses
     */
    SetAllIpsecTunnelAddresses(pTunnelAddress, pDestinationAddress) {
        result := ComCall(6, this, "ptr", pTunnelAddress, "ptr", pDestinationAddress, "HRESULT")
        return result
    }

    /**
     * Not supported.
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
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsserviceiscsi-setallipsecsecurity
     */
    SetAllIpsecSecurity(targetPortalId, ullSecurityFlags, pIpsecKey) {
        result := ComCall(7, this, "ptr", targetPortalId, "uint", ullSecurityFlags, "ptr", pIpsecKey, "HRESULT")
        return result
    }

    /**
     * Sets the initiator CHAP shared secret that is used for mutual CHAP authentication when the initiator authenticates the target.
     * @param {Pointer<VDS_ISCSI_SHARED_SECRET>} pInitiatorSharedSecret The address of a <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_iscsi_shared_secret">VDS_ISCSI_SHARED_SECRET</a> 
     *       structure that contains the shared secret. If the <b>pSharedSecret</b> member  is <b>NULL</b> and the <b>ulSharedSecretSize</b> is zero, the <b>SetInitiatorSharedSecret</b> method  clears   any existing secret. If this parameter is <b>NULL</b> and the <i>targetId</i> 
     *       parameter is not <b>GUID_NULL</b>, <b>SetInitiatorSharedSecret</b> clears the association between the initiator and the target.
     * @param {Guid} targetId The <b>VDS_OBJECT_ID</b> of the target. This parameter is set to 
     *       <b>GUID_NULL</b> if the shared secret is not to be target-specific.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
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
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsserviceiscsi-setinitiatorsharedsecret
     */
    SetInitiatorSharedSecret(pInitiatorSharedSecret, targetId) {
        result := ComCall(8, this, "ptr", pInitiatorSharedSecret, "ptr", targetId, "HRESULT")
        return result
    }

    /**
     * Communicates the CHAP shared secret of a target to the initiator service. This shared secret is used during target login when the target authenticates the initiator.
     * @param {Guid} targetId The <b>VDS_OBJECT_ID</b> of the target that has the specified shared secret. This parameter is required and cannot be GUID_NULL.
     * @param {Pointer<VDS_ISCSI_SHARED_SECRET>} pTargetSharedSecret The address of a <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_iscsi_shared_secret">VDS_ISCSI_SHARED_SECRET</a> structure 
     *       that contains the CHAP shared secret.
     * @returns {HRESULT} This method can return standard HRESULT values, such as E_INVALIDARG or E_OUTOFMEMORY, and <a href="/windows/desktop/VDS/virtual-disk-service-common-return-codes">VDS-specific return values</a>. It can also return converted <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>  using the <a href="/windows/desktop/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro. Errors can originate from VDS itself or from the underlying <a href="/windows/desktop/VDS/about-vds">VDS provider</a> that is being used. Possible return values include the following.
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
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsserviceiscsi-remembertargetsharedsecret
     */
    RememberTargetSharedSecret(targetId, pTargetSharedSecret) {
        result := ComCall(9, this, "ptr", targetId, "ptr", pTargetSharedSecret, "HRESULT")
        return result
    }
}
