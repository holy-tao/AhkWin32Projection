#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\CONTACT_AGGREGATION_BLOB.ahk" { CONTACT_AGGREGATION_BLOB }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IContactAggregationLink.ahk" { IContactAggregationLink }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Contacts
 */
export default struct IContactAggregationLinkCollection extends IUnknown {
    /**
     * The interface identifier for IContactAggregationLinkCollection
     * @type {Guid}
     */
    static IID := Guid("{f8bc0e93-fb55-4f28-b9fa-b1c274153292}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IContactAggregationLinkCollection interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        FindFirst           : IntPtr
        FindFirstByRemoteId : IntPtr
        FindNext            : IntPtr
        get_Count           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IContactAggregationLinkCollection.Vtbl()
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
     * @returns {IContactAggregationLink} 
     */
    FindFirst() {
        result := ComCall(3, this, "ptr*", &ppServerContactLink := 0, "HRESULT")
        return IContactAggregationLink(ppServerContactLink)
    }

    /**
     * 
     * @param {PWSTR} pSourceType 
     * @param {PWSTR} pAccountId 
     * @param {Pointer<CONTACT_AGGREGATION_BLOB>} pRemoteId 
     * @returns {IContactAggregationLink} 
     */
    FindFirstByRemoteId(pSourceType, pAccountId, pRemoteId) {
        pSourceType := pSourceType is String ? StrPtr(pSourceType) : pSourceType
        pAccountId := pAccountId is String ? StrPtr(pAccountId) : pAccountId

        result := ComCall(4, this, "ptr", pSourceType, "ptr", pAccountId, CONTACT_AGGREGATION_BLOB.Ptr, pRemoteId, "ptr*", &ppServerContactLink := 0, "HRESULT")
        return IContactAggregationLink(ppServerContactLink)
    }

    /**
     * 
     * @returns {IContactAggregationLink} 
     */
    FindNext() {
        result := ComCall(5, this, "ptr*", &ppServerContactLink := 0, "HRESULT")
        return IContactAggregationLink(ppServerContactLink)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(6, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    Query(iid) {
        if (IContactAggregationLinkCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.FindFirst := CallbackCreate(GetMethod(implObj, "FindFirst"), flags, 2)
        this.vtbl.FindFirstByRemoteId := CallbackCreate(GetMethod(implObj, "FindFirstByRemoteId"), flags, 5)
        this.vtbl.FindNext := CallbackCreate(GetMethod(implObj, "FindNext"), flags, 2)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.FindFirst)
        CallbackFree(this.vtbl.FindFirstByRemoteId)
        CallbackFree(this.vtbl.FindNext)
        CallbackFree(this.vtbl.get_Count)
    }
}
