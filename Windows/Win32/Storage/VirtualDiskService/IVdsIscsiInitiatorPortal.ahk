#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to query and interact with iSCSI initiator portals on the local system.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsiscsiinitiatorportal
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsIscsiInitiatorPortal extends IUnknown{
    /**
     * The interface identifier for IVdsIscsiInitiatorPortal
     * @type {Guid}
     */
    static IID => Guid("{38a0a9ab-7cc8-4693-ac07-1f28bd03c3da}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<VDS_ISCSI_INITIATOR_PORTAL_PROP>} pInitiatorPortalProp 
     * @returns {HRESULT} 
     */
    GetProperties(pInitiatorPortalProp) {
        result := ComCall(3, this, "ptr", pInitiatorPortalProp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IVdsIscsiInitiatorAdapter>} ppInitiatorAdapter 
     * @returns {HRESULT} 
     */
    GetInitiatorAdapter(ppInitiatorAdapter) {
        result := ComCall(4, this, "ptr", ppInitiatorAdapter, "int")
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
    SetIpsecTunnelAddress(pTunnelAddress, pDestinationAddress) {
        result := ComCall(5, this, "ptr", pTunnelAddress, "ptr", pDestinationAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} targetPortalId 
     * @param {Pointer<UInt64>} pullSecurityFlags 
     * @returns {HRESULT} 
     */
    GetIpsecSecurity(targetPortalId, pullSecurityFlags) {
        result := ComCall(6, this, "ptr", targetPortalId, "uint*", pullSecurityFlags, "int")
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
    SetIpsecSecurity(targetPortalId, ullSecurityFlags, pIpsecKey) {
        result := ComCall(7, this, "ptr", targetPortalId, "uint", ullSecurityFlags, "ptr", pIpsecKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
