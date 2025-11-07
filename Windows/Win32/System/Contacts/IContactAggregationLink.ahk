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
     * @returns {PWSTR} 
     */
    get_AccountId() {
        result := ComCall(5, this, "ptr*", &ppAccountId := 0, "HRESULT")
        return ppAccountId
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
     * @returns {PWSTR} 
     */
    get_Id() {
        result := ComCall(7, this, "ptr*", &ppItemId := 0, "HRESULT")
        return ppItemId
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsLinkResolved() {
        result := ComCall(8, this, "int*", &pIsLinkResolved := 0, "HRESULT")
        return pIsLinkResolved
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
     * @returns {PWSTR} 
     */
    get_NetworkSourceIdString() {
        result := ComCall(10, this, "ptr*", &ppNetworkSourceId := 0, "HRESULT")
        return ppNetworkSourceId
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
     * @returns {Pointer<CONTACT_AGGREGATION_BLOB>} 
     */
    get_RemoteObjectId() {
        result := ComCall(12, this, "ptr*", &ppRemoteObjectId := 0, "HRESULT")
        return ppRemoteObjectId
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
     * @returns {PWSTR} 
     */
    get_ServerPerson() {
        result := ComCall(14, this, "ptr*", &ppServerPersonId := 0, "HRESULT")
        return ppServerPersonId
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
     * @returns {PWSTR} 
     */
    get_ServerPersonBaseline() {
        result := ComCall(16, this, "ptr*", &ppServerPersonId := 0, "HRESULT")
        return ppServerPersonId
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
     * @returns {Pointer<CONTACT_AGGREGATION_BLOB>} 
     */
    get_SyncIdentityHash() {
        result := ComCall(18, this, "ptr*", &ppSyncIdentityHash := 0, "HRESULT")
        return ppSyncIdentityHash
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
