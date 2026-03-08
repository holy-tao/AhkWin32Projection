#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Contacts
 * @version v4.0.30319
 */
class IContactAggregationContact extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactAggregationContact
     * @type {Guid}
     */
    static IID => Guid("{1eb22e86-4c86-41f0-9f9f-c251e9fda6c3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Delete", "Save", "MoveToAggregate", "Unlink", "get_AccountId", "put_AccountId", "get_AggregateId", "get_Id", "get_IsMe", "get_IsExternal", "get_NetworkSourceId", "put_NetworkSourceId", "get_NetworkSourceIdString", "put_NetworkSourceIdString", "get_RemoteObjectId", "put_RemoteObjectId", "get_SyncIdentityHash", "put_SyncIdentityHash"]

    /**
     * @type {PWSTR} 
     */
    AccountId {
        get => this.get_AccountId()
        set => this.put_AccountId(value)
    }

    /**
     * @type {PWSTR} 
     */
    AggregateId {
        get => this.get_AggregateId()
    }

    /**
     * @type {PWSTR} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {BOOL} 
     */
    IsMe {
        get => this.get_IsMe()
    }

    /**
     * @type {BOOL} 
     */
    IsExternal {
        get => this.get_IsExternal()
    }

    /**
     * @type {Integer} 
     */
    NetworkSourceId {
        get => this.get_NetworkSourceId()
        set => this.put_NetworkSourceId(value)
    }

    /**
     * @type {PWSTR} 
     */
    NetworkSourceIdString {
        get => this.get_NetworkSourceIdString()
        set => this.put_NetworkSourceIdString(value)
    }

    /**
     * @type {Pointer<CONTACT_AGGREGATION_BLOB>} 
     */
    RemoteObjectId {
        get => this.get_RemoteObjectId()
        set => this.put_RemoteObjectId(value)
    }

    /**
     * @type {Pointer<CONTACT_AGGREGATION_BLOB>} 
     */
    SyncIdentityHash {
        get => this.get_SyncIdentityHash()
        set => this.put_SyncIdentityHash(value)
    }

    /**
     * Deletes an access control entry (ACE) from an access control list (ACL).
     * @remarks
     * An application can use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl_size_information">ACL_SIZE_INFORMATION</a> structure retrieved by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-getaclinformation">GetAclInformation</a> function to discover the size of the ACL and the number of ACEs it contains. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-getace">GetAce</a> function retrieves information about an individual ACE.
     * @returns {HRESULT} If the function succeeds, the function returns nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-deleteace
     */
    Delete() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * The SaveBookmark method saves the current disc position and state of the MSWebDVD object so the user can return to the same place later.
     * @remarks
     * A bookmark is a snapshot of the DVD Navigator's current state. This includes information such as where it is playing on the disc, and which audio and subpictures streams are selected. By saving a bookmark, the user can close the application, shut down the computer, and come back later to continue viewing the disc right where he or she left off, with all settings just as they were before. Only one bookmark can be saved at any given time. When you call `SaveBookmark`, the old bookmark is overwritten.
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/savebookmark-method
     */
    Save() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pAggregateId 
     * @returns {HRESULT} 
     */
    MoveToAggregate(pAggregateId) {
        pAggregateId := pAggregateId is String ? StrPtr(pAggregateId) : pAggregateId

        result := ComCall(5, this, "ptr", pAggregateId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Unlink() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    get_AccountId() {
        result := ComCall(7, this, "ptr*", &ppAccountId := 0, "HRESULT")
        return ppAccountId
    }

    /**
     * 
     * @param {PWSTR} pAccountId 
     * @returns {HRESULT} 
     */
    put_AccountId(pAccountId) {
        pAccountId := pAccountId is String ? StrPtr(pAccountId) : pAccountId

        result := ComCall(8, this, "ptr", pAccountId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    get_AggregateId() {
        result := ComCall(9, this, "ptr*", &ppAggregateId := 0, "HRESULT")
        return ppAggregateId
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    get_Id() {
        result := ComCall(10, this, "ptr*", &ppItemId := 0, "HRESULT")
        return ppItemId
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsMe() {
        result := ComCall(11, this, "int*", &pIsMe := 0, "HRESULT")
        return pIsMe
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsExternal() {
        result := ComCall(12, this, "int*", &pIsExternal := 0, "HRESULT")
        return pIsExternal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NetworkSourceId() {
        result := ComCall(13, this, "uint*", &pNetworkSourceId := 0, "HRESULT")
        return pNetworkSourceId
    }

    /**
     * 
     * @param {Integer} networkSourceId 
     * @returns {HRESULT} 
     */
    put_NetworkSourceId(networkSourceId) {
        result := ComCall(14, this, "uint", networkSourceId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    get_NetworkSourceIdString() {
        result := ComCall(15, this, "ptr*", &ppNetworkSourceId := 0, "HRESULT")
        return ppNetworkSourceId
    }

    /**
     * 
     * @param {PWSTR} pNetworkSourceId 
     * @returns {HRESULT} 
     */
    put_NetworkSourceIdString(pNetworkSourceId) {
        pNetworkSourceId := pNetworkSourceId is String ? StrPtr(pNetworkSourceId) : pNetworkSourceId

        result := ComCall(16, this, "ptr", pNetworkSourceId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer<CONTACT_AGGREGATION_BLOB>} 
     */
    get_RemoteObjectId() {
        result := ComCall(17, this, "ptr*", &ppRemoteObjectId := 0, "HRESULT")
        return ppRemoteObjectId
    }

    /**
     * 
     * @param {Pointer<CONTACT_AGGREGATION_BLOB>} pRemoteObjectId 
     * @returns {HRESULT} 
     */
    put_RemoteObjectId(pRemoteObjectId) {
        result := ComCall(18, this, "ptr", pRemoteObjectId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer<CONTACT_AGGREGATION_BLOB>} 
     */
    get_SyncIdentityHash() {
        result := ComCall(19, this, "ptr*", &ppSyncIdentityHash := 0, "HRESULT")
        return ppSyncIdentityHash
    }

    /**
     * 
     * @param {Pointer<CONTACT_AGGREGATION_BLOB>} pSyncIdentityHash 
     * @returns {HRESULT} 
     */
    put_SyncIdentityHash(pSyncIdentityHash) {
        result := ComCall(20, this, "ptr", pSyncIdentityHash, "HRESULT")
        return result
    }
}
