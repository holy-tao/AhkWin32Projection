#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to interface with the local initiator service, including the ability to set CHAP security settings and to log into targets.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsserviceiscsi
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsServiceIscsi extends IUnknown{
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
     * 
     * @param {Pointer<PWSTR>} ppwszIscsiName 
     * @returns {HRESULT} 
     */
    GetInitiatorName(ppwszIscsiName) {
        result := ComCall(3, this, "ptr", ppwszIscsiName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVdsObject>} ppEnum 
     * @returns {HRESULT} 
     */
    QueryInitiatorAdapters(ppEnum) {
        result := ComCall(4, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VDS_ISCSI_IPSEC_KEY>} pIpsecKey 
     * @returns {HRESULT} 
     */
    SetIpsecGroupPresharedKey(pIpsecKey) {
        result := ComCall(5, this, "ptr", pIpsecKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VDS_IPADDRESS>} pTunnelAddress 
     * @param {Pointer<VDS_IPADDRESS>} pDestinationAddress 
     * @returns {HRESULT} 
     */
    SetAllIpsecTunnelAddresses(pTunnelAddress, pDestinationAddress) {
        result := ComCall(6, this, "ptr", pTunnelAddress, "ptr", pDestinationAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} targetPortalId 
     * @param {Integer} ullSecurityFlags 
     * @param {Pointer<VDS_ISCSI_IPSEC_KEY>} pIpsecKey 
     * @returns {HRESULT} 
     */
    SetAllIpsecSecurity(targetPortalId, ullSecurityFlags, pIpsecKey) {
        result := ComCall(7, this, "ptr", targetPortalId, "uint", ullSecurityFlags, "ptr", pIpsecKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VDS_ISCSI_SHARED_SECRET>} pInitiatorSharedSecret 
     * @param {Pointer<Guid>} targetId 
     * @returns {HRESULT} 
     */
    SetInitiatorSharedSecret(pInitiatorSharedSecret, targetId) {
        result := ComCall(8, this, "ptr", pInitiatorSharedSecret, "ptr", targetId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} targetId 
     * @param {Pointer<VDS_ISCSI_SHARED_SECRET>} pTargetSharedSecret 
     * @returns {HRESULT} 
     */
    RememberTargetSharedSecret(targetId, pTargetSharedSecret) {
        result := ComCall(9, this, "ptr", targetId, "ptr", pTargetSharedSecret, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
