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
export default struct IContactAggregationContact extends IUnknown {
    /**
     * The interface identifier for IContactAggregationContact
     * @type {Guid}
     */
    static IID := Guid("{1eb22e86-4c86-41f0-9f9f-c251e9fda6c3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IContactAggregationContact interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Delete                    : IntPtr
        Save                      : IntPtr
        MoveToAggregate           : IntPtr
        Unlink                    : IntPtr
        get_AccountId             : IntPtr
        put_AccountId             : IntPtr
        get_AggregateId           : IntPtr
        get_Id                    : IntPtr
        get_IsMe                  : IntPtr
        get_IsExternal            : IntPtr
        get_NetworkSourceId       : IntPtr
        put_NetworkSourceId       : IntPtr
        get_NetworkSourceIdString : IntPtr
        put_NetworkSourceIdString : IntPtr
        get_RemoteObjectId        : IntPtr
        put_RemoteObjectId        : IntPtr
        get_SyncIdentityHash      : IntPtr
        put_SyncIdentityHash      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IContactAggregationContact.Vtbl()
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
        result := ComCall(7, this, PWSTR.Ptr, &ppAccountId := 0, "HRESULT")
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
        result := ComCall(9, this, PWSTR.Ptr, &ppAggregateId := 0, "HRESULT")
        return ppAggregateId
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    get_Id() {
        result := ComCall(10, this, PWSTR.Ptr, &ppItemId := 0, "HRESULT")
        return ppItemId
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsMe() {
        result := ComCall(11, this, BOOL.Ptr, &pIsMe := 0, "HRESULT")
        return pIsMe
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsExternal() {
        result := ComCall(12, this, BOOL.Ptr, &pIsExternal := 0, "HRESULT")
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
        result := ComCall(15, this, PWSTR.Ptr, &ppNetworkSourceId := 0, "HRESULT")
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
        result := ComCall(18, this, CONTACT_AGGREGATION_BLOB.Ptr, pRemoteObjectId, "HRESULT")
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
        result := ComCall(20, this, CONTACT_AGGREGATION_BLOB.Ptr, pSyncIdentityHash, "HRESULT")
        return result
    }

    Query(iid) {
        if (IContactAggregationContact.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Delete := CallbackCreate(GetMethod(implObj, "Delete"), flags, 1)
        this.vtbl.Save := CallbackCreate(GetMethod(implObj, "Save"), flags, 1)
        this.vtbl.MoveToAggregate := CallbackCreate(GetMethod(implObj, "MoveToAggregate"), flags, 2)
        this.vtbl.Unlink := CallbackCreate(GetMethod(implObj, "Unlink"), flags, 1)
        this.vtbl.get_AccountId := CallbackCreate(GetMethod(implObj, "get_AccountId"), flags, 2)
        this.vtbl.put_AccountId := CallbackCreate(GetMethod(implObj, "put_AccountId"), flags, 2)
        this.vtbl.get_AggregateId := CallbackCreate(GetMethod(implObj, "get_AggregateId"), flags, 2)
        this.vtbl.get_Id := CallbackCreate(GetMethod(implObj, "get_Id"), flags, 2)
        this.vtbl.get_IsMe := CallbackCreate(GetMethod(implObj, "get_IsMe"), flags, 2)
        this.vtbl.get_IsExternal := CallbackCreate(GetMethod(implObj, "get_IsExternal"), flags, 2)
        this.vtbl.get_NetworkSourceId := CallbackCreate(GetMethod(implObj, "get_NetworkSourceId"), flags, 2)
        this.vtbl.put_NetworkSourceId := CallbackCreate(GetMethod(implObj, "put_NetworkSourceId"), flags, 2)
        this.vtbl.get_NetworkSourceIdString := CallbackCreate(GetMethod(implObj, "get_NetworkSourceIdString"), flags, 2)
        this.vtbl.put_NetworkSourceIdString := CallbackCreate(GetMethod(implObj, "put_NetworkSourceIdString"), flags, 2)
        this.vtbl.get_RemoteObjectId := CallbackCreate(GetMethod(implObj, "get_RemoteObjectId"), flags, 2)
        this.vtbl.put_RemoteObjectId := CallbackCreate(GetMethod(implObj, "put_RemoteObjectId"), flags, 2)
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
        CallbackFree(this.vtbl.MoveToAggregate)
        CallbackFree(this.vtbl.Unlink)
        CallbackFree(this.vtbl.get_AccountId)
        CallbackFree(this.vtbl.put_AccountId)
        CallbackFree(this.vtbl.get_AggregateId)
        CallbackFree(this.vtbl.get_Id)
        CallbackFree(this.vtbl.get_IsMe)
        CallbackFree(this.vtbl.get_IsExternal)
        CallbackFree(this.vtbl.get_NetworkSourceId)
        CallbackFree(this.vtbl.put_NetworkSourceId)
        CallbackFree(this.vtbl.get_NetworkSourceIdString)
        CallbackFree(this.vtbl.put_NetworkSourceIdString)
        CallbackFree(this.vtbl.get_RemoteObjectId)
        CallbackFree(this.vtbl.put_RemoteObjectId)
        CallbackFree(this.vtbl.get_SyncIdentityHash)
        CallbackFree(this.vtbl.put_SyncIdentityHash)
    }
}
