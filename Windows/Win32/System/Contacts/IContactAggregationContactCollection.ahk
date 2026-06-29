#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\CONTACT_AGGREGATION_BLOB.ahk" { CONTACT_AGGREGATION_BLOB }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IContactAggregationContact.ahk" { IContactAggregationContact }

/**
 * @namespace Windows.Win32.System.Contacts
 */
export default struct IContactAggregationContactCollection extends IUnknown {
    /**
     * The interface identifier for IContactAggregationContactCollection
     * @type {Guid}
     */
    static IID := Guid("{826e66fa-81de-43ca-a6fb-8c785cd996c6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IContactAggregationContactCollection interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        FindFirst               : IntPtr
        FindNext                : IntPtr
        FindFirstByIdentityHash : IntPtr
        get_Count               : IntPtr
        FindFirstByRemoteId     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IContactAggregationContactCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * 
     * @returns {IContactAggregationContact} 
     */
    FindFirst() {
        result := ComCall(3, this, "ptr*", &ppItem := 0, "HRESULT")
        return IContactAggregationContact(ppItem)
    }

    /**
     * 
     * @returns {IContactAggregationContact} 
     */
    FindNext() {
        result := ComCall(4, this, "ptr*", &ppItem := 0, "HRESULT")
        return IContactAggregationContact(ppItem)
    }

    /**
     * 
     * @param {PWSTR} pSourceType 
     * @param {PWSTR} pAccountId 
     * @param {Pointer<CONTACT_AGGREGATION_BLOB>} pIdentityHash 
     * @returns {IContactAggregationContact} 
     */
    FindFirstByIdentityHash(pSourceType, pAccountId, pIdentityHash) {
        pSourceType := pSourceType is String ? StrPtr(pSourceType) : pSourceType
        pAccountId := pAccountId is String ? StrPtr(pAccountId) : pAccountId

        result := ComCall(5, this, "ptr", pSourceType, "ptr", pAccountId, CONTACT_AGGREGATION_BLOB.Ptr, pIdentityHash, "ptr*", &ppItem := 0, "HRESULT")
        return IContactAggregationContact(ppItem)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(6, this, "int*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * 
     * @param {PWSTR} pSourceType 
     * @param {PWSTR} pAccountId 
     * @param {Pointer<CONTACT_AGGREGATION_BLOB>} pRemoteObjectId 
     * @returns {IContactAggregationContact} 
     */
    FindFirstByRemoteId(pSourceType, pAccountId, pRemoteObjectId) {
        pSourceType := pSourceType is String ? StrPtr(pSourceType) : pSourceType
        pAccountId := pAccountId is String ? StrPtr(pAccountId) : pAccountId

        result := ComCall(7, this, "ptr", pSourceType, "ptr", pAccountId, CONTACT_AGGREGATION_BLOB.Ptr, pRemoteObjectId, "ptr*", &ppItem := 0, "HRESULT")
        return IContactAggregationContact(ppItem)
    }

    Query(iid) {
        if (IContactAggregationContactCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.FindFirst := CallbackCreate(GetMethod(implObj, "FindFirst"), flags, 2)
        this.vtbl.FindNext := CallbackCreate(GetMethod(implObj, "FindNext"), flags, 2)
        this.vtbl.FindFirstByIdentityHash := CallbackCreate(GetMethod(implObj, "FindFirstByIdentityHash"), flags, 5)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.FindFirstByRemoteId := CallbackCreate(GetMethod(implObj, "FindFirstByRemoteId"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.FindFirst)
        CallbackFree(this.vtbl.FindNext)
        CallbackFree(this.vtbl.FindFirstByIdentityHash)
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.FindFirstByRemoteId)
    }
}
