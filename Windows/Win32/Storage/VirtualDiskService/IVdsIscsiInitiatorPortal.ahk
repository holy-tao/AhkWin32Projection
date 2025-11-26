#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VDS_ISCSI_INITIATOR_PORTAL_PROP.ahk
#Include .\IVdsIscsiInitiatorAdapter.ahk
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
     * Returns the properties of an initiator portal.
     * @returns {VDS_ISCSI_INITIATOR_PORTAL_PROP} The address of a 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_iscsi_initiator_portal_prop">VDS_ISCSI_INITIATOR_PORTAL_PROP</a> 
     *       structure allocated by the caller.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsiscsiinitiatorportal-getproperties
     */
    GetProperties() {
        pInitiatorPortalProp := VDS_ISCSI_INITIATOR_PORTAL_PROP()
        result := ComCall(3, this, "ptr", pInitiatorPortalProp, "HRESULT")
        return pInitiatorPortalProp
    }

    /**
     * Returns the initiator adapter to which the initiator portal belongs.
     * @returns {IVdsIscsiInitiatorAdapter} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vds/nn-vds-ivdsiscsiinitiatoradapter">IVdsIscsiInitiatorAdapter</a> 
     *       interface pointer. VDS initializes the interface on return. Callers must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsiscsiinitiatorportal-getinitiatoradapter
     */
    GetInitiatorAdapter() {
        result := ComCall(4, this, "ptr*", &ppInitiatorAdapter := 0, "HRESULT")
        return IVdsIscsiInitiatorAdapter(ppInitiatorAdapter)
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
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsiscsiinitiatorportal-setipsectunneladdress
     */
    SetIpsecTunnelAddress(pTunnelAddress, pDestinationAddress) {
        result := ComCall(5, this, "ptr", pTunnelAddress, "ptr", pDestinationAddress, "HRESULT")
        return result
    }

    /**
     * Not supported.This method is reserved for future use.
     * @param {Guid} targetPortalId Reserved for future use.
     * @returns {Integer} Reserved for future use.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsiscsiinitiatorportal-getipsecsecurity
     */
    GetIpsecSecurity(targetPortalId) {
        result := ComCall(6, this, "ptr", targetPortalId, "uint*", &pullSecurityFlags := 0, "HRESULT")
        return pullSecurityFlags
    }

    /**
     * Not supported.This method is reserved for future use.
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
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsiscsiinitiatorportal-setipsecsecurity
     */
    SetIpsecSecurity(targetPortalId, ullSecurityFlags, pIpsecKey) {
        result := ComCall(7, this, "ptr", targetPortalId, "uint", ullSecurityFlags, "ptr", pIpsecKey, "HRESULT")
        return result
    }
}
