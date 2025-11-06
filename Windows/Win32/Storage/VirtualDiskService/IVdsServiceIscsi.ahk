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
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsserviceiscsi-getinitiatorname
     */
    GetInitiatorName() {
        result := ComCall(3, this, "ptr*", &ppwszIscsiName := 0, "HRESULT")
        return ppwszIscsiName
    }

    /**
     * 
     * @returns {IEnumVdsObject} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsserviceiscsi-queryinitiatoradapters
     */
    QueryInitiatorAdapters() {
        result := ComCall(4, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumVdsObject(ppEnum)
    }

    /**
     * 
     * @param {Pointer<VDS_ISCSI_IPSEC_KEY>} pIpsecKey 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsserviceiscsi-setipsecgrouppresharedkey
     */
    SetIpsecGroupPresharedKey(pIpsecKey) {
        result := ComCall(5, this, "ptr", pIpsecKey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VDS_IPADDRESS>} pTunnelAddress 
     * @param {Pointer<VDS_IPADDRESS>} pDestinationAddress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsserviceiscsi-setallipsectunneladdresses
     */
    SetAllIpsecTunnelAddresses(pTunnelAddress, pDestinationAddress) {
        result := ComCall(6, this, "ptr", pTunnelAddress, "ptr", pDestinationAddress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} targetPortalId 
     * @param {Integer} ullSecurityFlags 
     * @param {Pointer<VDS_ISCSI_IPSEC_KEY>} pIpsecKey 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsserviceiscsi-setallipsecsecurity
     */
    SetAllIpsecSecurity(targetPortalId, ullSecurityFlags, pIpsecKey) {
        result := ComCall(7, this, "ptr", targetPortalId, "uint", ullSecurityFlags, "ptr", pIpsecKey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VDS_ISCSI_SHARED_SECRET>} pInitiatorSharedSecret 
     * @param {Guid} targetId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsserviceiscsi-setinitiatorsharedsecret
     */
    SetInitiatorSharedSecret(pInitiatorSharedSecret, targetId) {
        result := ComCall(8, this, "ptr", pInitiatorSharedSecret, "ptr", targetId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} targetId 
     * @param {Pointer<VDS_ISCSI_SHARED_SECRET>} pTargetSharedSecret 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsserviceiscsi-remembertargetsharedsecret
     */
    RememberTargetSharedSecret(targetId, pTargetSharedSecret) {
        result := ComCall(9, this, "ptr", targetId, "ptr", pTargetSharedSecret, "HRESULT")
        return result
    }
}
