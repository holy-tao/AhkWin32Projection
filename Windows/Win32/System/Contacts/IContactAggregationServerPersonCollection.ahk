#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IContactAggregationServerPerson.ahk" { IContactAggregationServerPerson }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Contacts
 */
export default struct IContactAggregationServerPersonCollection extends IUnknown {
    /**
     * The interface identifier for IContactAggregationServerPersonCollection
     * @type {Guid}
     */
    static IID := Guid("{4f730a4a-6604-47b6-a987-669ecf1e5751}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IContactAggregationServerPersonCollection interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        FindFirst                    : IntPtr
        FindFirstByServerId          : IntPtr
        FindFirstByAggregateId       : IntPtr
        FindFirstByLinkedAggregateId : IntPtr
        FindNext                     : IntPtr
        get_Count                    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IContactAggregationServerPersonCollection.Vtbl()
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
     * @returns {IContactAggregationServerPerson} 
     */
    FindFirst() {
        result := ComCall(3, this, "ptr*", &ppServerPerson := 0, "HRESULT")
        return IContactAggregationServerPerson(ppServerPerson)
    }

    /**
     * 
     * @param {PWSTR} pServerId 
     * @returns {IContactAggregationServerPerson} 
     */
    FindFirstByServerId(pServerId) {
        pServerId := pServerId is String ? StrPtr(pServerId) : pServerId

        result := ComCall(4, this, "ptr", pServerId, "ptr*", &ppServerPerson := 0, "HRESULT")
        return IContactAggregationServerPerson(ppServerPerson)
    }

    /**
     * 
     * @param {PWSTR} pAggregateId 
     * @returns {IContactAggregationServerPerson} 
     */
    FindFirstByAggregateId(pAggregateId) {
        pAggregateId := pAggregateId is String ? StrPtr(pAggregateId) : pAggregateId

        result := ComCall(5, this, "ptr", pAggregateId, "ptr*", &ppServerPerson := 0, "HRESULT")
        return IContactAggregationServerPerson(ppServerPerson)
    }

    /**
     * 
     * @param {PWSTR} pAggregateId 
     * @returns {IContactAggregationServerPerson} 
     */
    FindFirstByLinkedAggregateId(pAggregateId) {
        pAggregateId := pAggregateId is String ? StrPtr(pAggregateId) : pAggregateId

        result := ComCall(6, this, "ptr", pAggregateId, "ptr*", &ppServerPerson := 0, "HRESULT")
        return IContactAggregationServerPerson(ppServerPerson)
    }

    /**
     * 
     * @returns {IContactAggregationServerPerson} 
     */
    FindNext() {
        result := ComCall(7, this, "ptr*", &ppServerPerson := 0, "HRESULT")
        return IContactAggregationServerPerson(ppServerPerson)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(8, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    Query(iid) {
        if (IContactAggregationServerPersonCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.FindFirst := CallbackCreate(GetMethod(implObj, "FindFirst"), flags, 2)
        this.vtbl.FindFirstByServerId := CallbackCreate(GetMethod(implObj, "FindFirstByServerId"), flags, 3)
        this.vtbl.FindFirstByAggregateId := CallbackCreate(GetMethod(implObj, "FindFirstByAggregateId"), flags, 3)
        this.vtbl.FindFirstByLinkedAggregateId := CallbackCreate(GetMethod(implObj, "FindFirstByLinkedAggregateId"), flags, 3)
        this.vtbl.FindNext := CallbackCreate(GetMethod(implObj, "FindNext"), flags, 2)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.FindFirst)
        CallbackFree(this.vtbl.FindFirstByServerId)
        CallbackFree(this.vtbl.FindFirstByAggregateId)
        CallbackFree(this.vtbl.FindFirstByLinkedAggregateId)
        CallbackFree(this.vtbl.FindNext)
        CallbackFree(this.vtbl.get_Count)
    }
}
