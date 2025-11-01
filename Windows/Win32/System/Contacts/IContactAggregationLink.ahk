#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Contacts
 * @version v4.0.30319
 */
class IContactAggregationLink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactAggregationLink
     * @type {Guid}
     */
    static IID => Guid("{b6813323-a183-4654-8627-79b30de3a0ec}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Delete", "Save", "get_AccountId", "put_AccountId", "get_Id", "get_IsLinkResolved", "put_IsLinkResolved", "get_NetworkSourceIdString", "put_NetworkSourceIdString", "get_RemoteObjectId", "put_RemoteObjectId", "get_ServerPerson", "put_ServerPerson", "get_ServerPersonBaseline", "put_ServerPersonBaseline", "get_SyncIdentityHash", "put_SyncIdentityHash"]

    /**
     * 
     * @returns {HRESULT} 
     */
    Delete() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Save() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppAccountId 
     * @returns {HRESULT} 
     */
    get_AccountId(ppAccountId) {
        result := ComCall(5, this, "ptr", ppAccountId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pAccountId 
     * @returns {HRESULT} 
     */
    put_AccountId(pAccountId) {
        pAccountId := pAccountId is String ? StrPtr(pAccountId) : pAccountId

        result := ComCall(6, this, "ptr", pAccountId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppItemId 
     * @returns {HRESULT} 
     */
    get_Id(ppItemId) {
        result := ComCall(7, this, "ptr", ppItemId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsLinkResolved 
     * @returns {HRESULT} 
     */
    get_IsLinkResolved(pIsLinkResolved) {
        result := ComCall(8, this, "ptr", pIsLinkResolved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} isLinkResolved 
     * @returns {HRESULT} 
     */
    put_IsLinkResolved(isLinkResolved) {
        result := ComCall(9, this, "int", isLinkResolved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppNetworkSourceId 
     * @returns {HRESULT} 
     */
    get_NetworkSourceIdString(ppNetworkSourceId) {
        result := ComCall(10, this, "ptr", ppNetworkSourceId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pNetworkSourceId 
     * @returns {HRESULT} 
     */
    put_NetworkSourceIdString(pNetworkSourceId) {
        pNetworkSourceId := pNetworkSourceId is String ? StrPtr(pNetworkSourceId) : pNetworkSourceId

        result := ComCall(11, this, "ptr", pNetworkSourceId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<CONTACT_AGGREGATION_BLOB>>} ppRemoteObjectId 
     * @returns {HRESULT} 
     */
    get_RemoteObjectId(ppRemoteObjectId) {
        result := ComCall(12, this, "ptr*", ppRemoteObjectId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<CONTACT_AGGREGATION_BLOB>} pRemoteObjectId 
     * @returns {HRESULT} 
     */
    put_RemoteObjectId(pRemoteObjectId) {
        result := ComCall(13, this, "ptr", pRemoteObjectId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppServerPersonId 
     * @returns {HRESULT} 
     */
    get_ServerPerson(ppServerPersonId) {
        result := ComCall(14, this, "ptr", ppServerPersonId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pServerPersonId 
     * @returns {HRESULT} 
     */
    put_ServerPerson(pServerPersonId) {
        pServerPersonId := pServerPersonId is String ? StrPtr(pServerPersonId) : pServerPersonId

        result := ComCall(15, this, "ptr", pServerPersonId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppServerPersonId 
     * @returns {HRESULT} 
     */
    get_ServerPersonBaseline(ppServerPersonId) {
        result := ComCall(16, this, "ptr", ppServerPersonId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pServerPersonId 
     * @returns {HRESULT} 
     */
    put_ServerPersonBaseline(pServerPersonId) {
        pServerPersonId := pServerPersonId is String ? StrPtr(pServerPersonId) : pServerPersonId

        result := ComCall(17, this, "ptr", pServerPersonId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<CONTACT_AGGREGATION_BLOB>>} ppSyncIdentityHash 
     * @returns {HRESULT} 
     */
    get_SyncIdentityHash(ppSyncIdentityHash) {
        result := ComCall(18, this, "ptr*", ppSyncIdentityHash, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<CONTACT_AGGREGATION_BLOB>} pSyncIdentityHash 
     * @returns {HRESULT} 
     */
    put_SyncIdentityHash(pSyncIdentityHash) {
        result := ComCall(19, this, "ptr", pSyncIdentityHash, "HRESULT")
        return result
    }
}
