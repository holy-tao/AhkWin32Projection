#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IContactAggregationAggregate.ahk" { IContactAggregationAggregate }

/**
 * @namespace Windows.Win32.System.Contacts
 */
export default struct IContactAggregationAggregateCollection extends IUnknown {
    /**
     * The interface identifier for IContactAggregationAggregateCollection
     * @type {Guid}
     */
    static IID := Guid("{2359f3a6-3a68-40af-98db-0f9eb143c3bb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IContactAggregationAggregateCollection interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        FindFirst             : IntPtr
        FindFirstByAntiLinkId : IntPtr
        FindNext              : IntPtr
        get_Count             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IContactAggregationAggregateCollection.Vtbl()
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
     * @returns {IContactAggregationAggregate} 
     */
    FindFirst() {
        result := ComCall(3, this, "ptr*", &ppAggregate := 0, "HRESULT")
        return IContactAggregationAggregate(ppAggregate)
    }

    /**
     * 
     * @param {PWSTR} pAntiLinkId 
     * @returns {IContactAggregationAggregate} 
     */
    FindFirstByAntiLinkId(pAntiLinkId) {
        pAntiLinkId := pAntiLinkId is String ? StrPtr(pAntiLinkId) : pAntiLinkId

        result := ComCall(4, this, "ptr", pAntiLinkId, "ptr*", &ppAggregate := 0, "HRESULT")
        return IContactAggregationAggregate(ppAggregate)
    }

    /**
     * 
     * @returns {IContactAggregationAggregate} 
     */
    FindNext() {
        result := ComCall(5, this, "ptr*", &ppAggregate := 0, "HRESULT")
        return IContactAggregationAggregate(ppAggregate)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(6, this, "int*", &pCount := 0, "HRESULT")
        return pCount
    }

    Query(iid) {
        if (IContactAggregationAggregateCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.FindFirst := CallbackCreate(GetMethod(implObj, "FindFirst"), flags, 2)
        this.vtbl.FindFirstByAntiLinkId := CallbackCreate(GetMethod(implObj, "FindFirstByAntiLinkId"), flags, 3)
        this.vtbl.FindNext := CallbackCreate(GetMethod(implObj, "FindNext"), flags, 2)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.FindFirst)
        CallbackFree(this.vtbl.FindFirstByAntiLinkId)
        CallbackFree(this.vtbl.FindNext)
        CallbackFree(this.vtbl.get_Count)
    }
}
