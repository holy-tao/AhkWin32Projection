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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProperties", "GetInitiatorAdapter", "SetIpsecTunnelAddress", "GetIpsecSecurity", "SetIpsecSecurity"]

    /**
     * 
     * @param {Pointer<VDS_ISCSI_INITIATOR_PORTAL_PROP>} pInitiatorPortalProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsiscsiinitiatorportal-getproperties
     */
    GetProperties(pInitiatorPortalProp) {
        result := ComCall(3, this, "ptr", pInitiatorPortalProp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IVdsIscsiInitiatorAdapter>} ppInitiatorAdapter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsiscsiinitiatorportal-getinitiatoradapter
     */
    GetInitiatorAdapter(ppInitiatorAdapter) {
        result := ComCall(4, this, "ptr*", ppInitiatorAdapter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VDS_IPADDRESS>} pTunnelAddress 
     * @param {Pointer<VDS_IPADDRESS>} pDestinationAddress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsiscsiinitiatorportal-setipsectunneladdress
     */
    SetIpsecTunnelAddress(pTunnelAddress, pDestinationAddress) {
        result := ComCall(5, this, "ptr", pTunnelAddress, "ptr", pDestinationAddress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} targetPortalId 
     * @param {Pointer<Integer>} pullSecurityFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsiscsiinitiatorportal-getipsecsecurity
     */
    GetIpsecSecurity(targetPortalId, pullSecurityFlags) {
        result := ComCall(6, this, "ptr", targetPortalId, "uint*", pullSecurityFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} targetPortalId 
     * @param {Integer} ullSecurityFlags 
     * @param {Pointer<VDS_ISCSI_IPSEC_KEY>} pIpsecKey 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsiscsiinitiatorportal-setipsecsecurity
     */
    SetIpsecSecurity(targetPortalId, ullSecurityFlags, pIpsecKey) {
        result := ComCall(7, this, "ptr", targetPortalId, "uint", ullSecurityFlags, "ptr", pIpsecKey, "HRESULT")
        return result
    }
}
