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
     * 
     * @param {Pointer<VDS_ISCSI_PORTAL_PROP>} pPortalProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsiscsiportal-getproperties
     */
    GetProperties(pPortalProp) {
        result := ComCall(3, this, "ptr", pPortalProp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IVdsSubSystem>} ppSubSystem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsiscsiportal-getsubsystem
     */
    GetSubSystem(ppSubSystem) {
        result := ComCall(4, this, "ptr*", ppSubSystem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVdsObject>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsiscsiportal-queryassociatedportalgroups
     */
    QueryAssociatedPortalGroups(ppEnum) {
        result := ComCall(5, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} status 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsiscsiportal-setstatus
     */
    SetStatus(status) {
        result := ComCall(6, this, "int", status, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VDS_IPADDRESS>} pTunnelAddress 
     * @param {Pointer<VDS_IPADDRESS>} pDestinationAddress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsiscsiportal-setipsectunneladdress
     */
    SetIpsecTunnelAddress(pTunnelAddress, pDestinationAddress) {
        result := ComCall(7, this, "ptr", pTunnelAddress, "ptr", pDestinationAddress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VDS_IPADDRESS>} pInitiatorPortalAddress 
     * @param {Pointer<Integer>} pullSecurityFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsiscsiportal-getipsecsecurity
     */
    GetIpsecSecurity(pInitiatorPortalAddress, pullSecurityFlags) {
        result := ComCall(8, this, "ptr", pInitiatorPortalAddress, "uint*", pullSecurityFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VDS_IPADDRESS>} pInitiatorPortalAddress 
     * @param {Integer} ullSecurityFlags 
     * @param {Pointer<VDS_ISCSI_IPSEC_KEY>} pIpsecKey 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsiscsiportal-setipsecsecurity
     */
    SetIpsecSecurity(pInitiatorPortalAddress, ullSecurityFlags, pIpsecKey) {
        result := ComCall(9, this, "ptr", pInitiatorPortalAddress, "uint", ullSecurityFlags, "ptr", pIpsecKey, "HRESULT")
        return result
    }
}
