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
     * 
     * @param {Pointer<VDS_ISCSI_INITIATOR_ADAPTER_PROP>} pInitiatorAdapterProp 
     * @returns {HRESULT} 
     */
    GetProperties(pInitiatorAdapterProp) {
        result := ComCall(3, this, "ptr", pInitiatorAdapterProp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVdsObject>} ppEnum 
     * @returns {HRESULT} 
     */
    QueryInitiatorPortals(ppEnum) {
        result := ComCall(4, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} loginType 
     * @param {Pointer<Guid>} targetId 
     * @param {Pointer<Guid>} targetPortalId 
     * @param {Pointer<Guid>} initiatorPortalId 
     * @param {Integer} ulLoginFlags 
     * @param {BOOL} bHeaderDigest 
     * @param {BOOL} bDataDigest 
     * @param {Integer} authType 
     * @param {Pointer<IVdsAsync>} ppAsync 
     * @returns {HRESULT} 
     */
    LoginToTarget(loginType, targetId, targetPortalId, initiatorPortalId, ulLoginFlags, bHeaderDigest, bDataDigest, authType, ppAsync) {
        result := ComCall(5, this, "int", loginType, "ptr", targetId, "ptr", targetPortalId, "ptr", initiatorPortalId, "uint", ulLoginFlags, "int", bHeaderDigest, "int", bDataDigest, "int", authType, "ptr", ppAsync, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} targetId 
     * @param {Pointer<IVdsAsync>} ppAsync 
     * @returns {HRESULT} 
     */
    LogoutFromTarget(targetId, ppAsync) {
        result := ComCall(6, this, "ptr", targetId, "ptr", ppAsync, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
