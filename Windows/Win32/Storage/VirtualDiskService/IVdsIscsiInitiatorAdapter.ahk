#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to query and interact with iSCSI initiator adapters on the local system.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsiscsiinitiatoradapter
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsIscsiInitiatorAdapter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsIscsiInitiatorAdapter
     * @type {Guid}
     */
    static IID => Guid("{b07fedd4-1682-4440-9189-a39b55194dc5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProperties", "QueryInitiatorPortals", "LoginToTarget", "LogoutFromTarget"]

    /**
     * 
     * @param {Pointer<VDS_ISCSI_INITIATOR_ADAPTER_PROP>} pInitiatorAdapterProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsiscsiinitiatoradapter-getproperties
     */
    GetProperties(pInitiatorAdapterProp) {
        result := ComCall(3, this, "ptr", pInitiatorAdapterProp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVdsObject>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsiscsiinitiatoradapter-queryinitiatorportals
     */
    QueryInitiatorPortals(ppEnum) {
        result := ComCall(4, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} loginType 
     * @param {Guid} targetId 
     * @param {Guid} targetPortalId 
     * @param {Guid} initiatorPortalId 
     * @param {Integer} ulLoginFlags 
     * @param {BOOL} bHeaderDigest 
     * @param {BOOL} bDataDigest 
     * @param {Integer} authType 
     * @param {Pointer<IVdsAsync>} ppAsync 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsiscsiinitiatoradapter-logintotarget
     */
    LoginToTarget(loginType, targetId, targetPortalId, initiatorPortalId, ulLoginFlags, bHeaderDigest, bDataDigest, authType, ppAsync) {
        result := ComCall(5, this, "int", loginType, "ptr", targetId, "ptr", targetPortalId, "ptr", initiatorPortalId, "uint", ulLoginFlags, "int", bHeaderDigest, "int", bDataDigest, "int", authType, "ptr*", ppAsync, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} targetId 
     * @param {Pointer<IVdsAsync>} ppAsync 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsiscsiinitiatoradapter-logoutfromtarget
     */
    LogoutFromTarget(targetId, ppAsync) {
        result := ComCall(6, this, "ptr", targetId, "ptr*", ppAsync, "HRESULT")
        return result
    }
}
