#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods for performing query and configuration operations on an iSCSI portal.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsiscsiportal
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsIscsiPortal extends IUnknown{
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
     * 
     * @param {Pointer<VDS_ISCSI_PORTAL_PROP>} pPortalProp 
     * @returns {HRESULT} 
     */
    GetProperties(pPortalProp) {
        result := ComCall(3, this, "ptr", pPortalProp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IVdsSubSystem>} ppSubSystem 
     * @returns {HRESULT} 
     */
    GetSubSystem(ppSubSystem) {
        result := ComCall(4, this, "ptr", ppSubSystem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVdsObject>} ppEnum 
     * @returns {HRESULT} 
     */
    QueryAssociatedPortalGroups(ppEnum) {
        result := ComCall(5, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} status 
     * @returns {HRESULT} 
     */
    SetStatus(status) {
        result := ComCall(6, this, "int", status, "int")
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
        result := ComCall(7, this, "ptr", pTunnelAddress, "ptr", pDestinationAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VDS_IPADDRESS>} pInitiatorPortalAddress 
     * @param {Pointer<UInt64>} pullSecurityFlags 
     * @returns {HRESULT} 
     */
    GetIpsecSecurity(pInitiatorPortalAddress, pullSecurityFlags) {
        result := ComCall(8, this, "ptr", pInitiatorPortalAddress, "uint*", pullSecurityFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VDS_IPADDRESS>} pInitiatorPortalAddress 
     * @param {Integer} ullSecurityFlags 
     * @param {Pointer<VDS_ISCSI_IPSEC_KEY>} pIpsecKey 
     * @returns {HRESULT} 
     */
    SetIpsecSecurity(pInitiatorPortalAddress, ullSecurityFlags, pIpsecKey) {
        result := ComCall(9, this, "ptr", pInitiatorPortalAddress, "uint", ullSecurityFlags, "ptr", pIpsecKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
