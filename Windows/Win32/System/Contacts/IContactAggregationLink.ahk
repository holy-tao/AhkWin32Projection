#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\CONTACT_AGGREGATION_BLOB.ahk" { CONTACT_AGGREGATION_BLOB }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Contacts
 */
export default struct IContactAggregationLink extends IUnknown {
    /**
     * The interface identifier for IContactAggregationLink
     * @type {Guid}
     */
    static IID := Guid("{b6813323-a183-4654-8627-79b30de3a0ec}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IContactAggregationLink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Delete                    : IntPtr
        Save                      : IntPtr
        get_AccountId             : IntPtr
        put_AccountId             : IntPtr
        get_Id                    : IntPtr
        get_IsLinkResolved        : IntPtr
        put_IsLinkResolved        : IntPtr
        get_NetworkSourceIdString : IntPtr
        put_NetworkSourceIdString : IntPtr
        get_RemoteObjectId        : IntPtr
        put_RemoteObjectId        : IntPtr
        get_ServerPerson          : IntPtr
        put_ServerPerson          : IntPtr
        get_ServerPersonBaseline  : IntPtr
        put_ServerPersonBaseline  : IntPtr
        get_SyncIdentityHash      : IntPtr
        put_SyncIdentityHash      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IContactAggregationLink.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
    Id {
        get => this.get_Id()
    }

    /**
     * @type {BOOL} 
     */
    IsLinkResolved {
        get => this.get_IsLinkResolved()
        set => this.put_IsLinkResolved(value)
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
     * @type {PWSTR} 
     */
    ServerPerson {
        get => this.get_ServerPerson()
        set => this.put_ServerPerson(value)
    }

    /**
     * @type {PWSTR} 
     */
    ServerPersonBaseline {
        get => this.get_ServerPersonBaseline()
        set => this.put_ServerPersonBaseline(value)
    }

    /**
     * @type {Pointer<CONTACT_AGGREGATION_BLOB>} 
     */
    SyncIdentityHash {
        get => this.get_SyncIdentityHash()
        set => this.put_SyncIdentityHash(value)
    }

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
        result := ComCall(5, this, PWSTR.Ptr, &ppAccountId := 0, "HRESULT")
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
        result := ComCall(7, this, PWSTR.Ptr, &ppItemId := 0, "HRESULT")
        return ppItemId
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsLinkResolved() {
        result := ComCall(8, this, BOOL.Ptr, &pIsLinkResolved := 0, "HRESULT")
        return pIsLinkResolved
    }

    /**
     * 
     * @param {BOOL} isLinkResolved 
     * @returns {HRESULT} 
     */
    put_IsLinkResolved(isLinkResolved) {
        result := ComCall(9, this, BOOL, isLinkResolved, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    get_NetworkSourceIdString() {
        result := ComCall(10, this, PWSTR.Ptr, &ppNetworkSourceId := 0, "HRESULT")
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
        result := ComCall(13, this, CONTACT_AGGREGATION_BLOB.Ptr, pRemoteObjectId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    get_ServerPerson() {
        result := ComCall(14, this, PWSTR.Ptr, &ppServerPersonId := 0, "HRESULT")
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
        result := ComCall(16, this, PWSTR.Ptr, &ppServerPersonId := 0, "HRESULT")
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
        result := ComCall(19, this, CONTACT_AGGREGATION_BLOB.Ptr, pSyncIdentityHash, "HRESULT")
        return result
    }

    Query(iid) {
        if (IContactAggregationLink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Delete := CallbackCreate(GetMethod(implObj, "Delete"), flags, 1)
        this.vtbl.Save := CallbackCreate(GetMethod(implObj, "Save"), flags, 1)
        this.vtbl.get_AccountId := CallbackCreate(GetMethod(implObj, "get_AccountId"), flags, 2)
        this.vtbl.put_AccountId := CallbackCreate(GetMethod(implObj, "put_AccountId"), flags, 2)
        this.vtbl.get_Id := CallbackCreate(GetMethod(implObj, "get_Id"), flags, 2)
        this.vtbl.get_IsLinkResolved := CallbackCreate(GetMethod(implObj, "get_IsLinkResolved"), flags, 2)
        this.vtbl.put_IsLinkResolved := CallbackCreate(GetMethod(implObj, "put_IsLinkResolved"), flags, 2)
        this.vtbl.get_NetworkSourceIdString := CallbackCreate(GetMethod(implObj, "get_NetworkSourceIdString"), flags, 2)
        this.vtbl.put_NetworkSourceIdString := CallbackCreate(GetMethod(implObj, "put_NetworkSourceIdString"), flags, 2)
        this.vtbl.get_RemoteObjectId := CallbackCreate(GetMethod(implObj, "get_RemoteObjectId"), flags, 2)
        this.vtbl.put_RemoteObjectId := CallbackCreate(GetMethod(implObj, "put_RemoteObjectId"), flags, 2)
        this.vtbl.get_ServerPerson := CallbackCreate(GetMethod(implObj, "get_ServerPerson"), flags, 2)
        this.vtbl.put_ServerPerson := CallbackCreate(GetMethod(implObj, "put_ServerPerson"), flags, 2)
        this.vtbl.get_ServerPersonBaseline := CallbackCreate(GetMethod(implObj, "get_ServerPersonBaseline"), flags, 2)
        this.vtbl.put_ServerPersonBaseline := CallbackCreate(GetMethod(implObj, "put_ServerPersonBaseline"), flags, 2)
        this.vtbl.get_SyncIdentityHash := CallbackCreate(GetMethod(implObj, "get_SyncIdentityHash"), flags, 2)
        this.vtbl.put_SyncIdentityHash := CallbackCreate(GetMethod(implObj, "put_SyncIdentityHash"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Delete)
        CallbackFree(this.vtbl.Save)
        CallbackFree(this.vtbl.get_AccountId)
        CallbackFree(this.vtbl.put_AccountId)
        CallbackFree(this.vtbl.get_Id)
        CallbackFree(this.vtbl.get_IsLinkResolved)
        CallbackFree(this.vtbl.put_IsLinkResolved)
        CallbackFree(this.vtbl.get_NetworkSourceIdString)
        CallbackFree(this.vtbl.put_NetworkSourceIdString)
        CallbackFree(this.vtbl.get_RemoteObjectId)
        CallbackFree(this.vtbl.put_RemoteObjectId)
        CallbackFree(this.vtbl.get_ServerPerson)
        CallbackFree(this.vtbl.put_ServerPerson)
        CallbackFree(this.vtbl.get_ServerPersonBaseline)
        CallbackFree(this.vtbl.put_ServerPersonBaseline)
        CallbackFree(this.vtbl.get_SyncIdentityHash)
        CallbackFree(this.vtbl.put_SyncIdentityHash)
    }
}
