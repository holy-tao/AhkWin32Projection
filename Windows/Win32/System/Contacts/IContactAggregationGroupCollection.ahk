#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IContactAggregationGroup.ahk" { IContactAggregationGroup }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Contacts
 */
export default struct IContactAggregationGroupCollection extends IUnknown {
    /**
     * The interface identifier for IContactAggregationGroupCollection
     * @type {Guid}
     */
    static IID := Guid("{20a19a9c-d2f3-4b83-9143-beffd2cc226d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IContactAggregationGroupCollection interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        FindFirst                 : IntPtr
        FindFirstByGlobalObjectId : IntPtr
        FindNext                  : IntPtr
        get_Count                 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IContactAggregationGroupCollection.Vtbl()
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
     * @returns {IContactAggregationGroup} 
     */
    FindFirst() {
        result := ComCall(3, this, "ptr*", &ppGroup := 0, "HRESULT")
        return IContactAggregationGroup(ppGroup)
    }

    /**
     * 
     * @param {Pointer<Guid>} pGlobalObjectId 
     * @returns {IContactAggregationGroup} 
     */
    FindFirstByGlobalObjectId(pGlobalObjectId) {
        result := ComCall(4, this, Guid.Ptr, pGlobalObjectId, "ptr*", &ppGroup := 0, "HRESULT")
        return IContactAggregationGroup(ppGroup)
    }

    /**
     * 
     * @returns {IContactAggregationGroup} 
     */
    FindNext() {
        result := ComCall(5, this, "ptr*", &ppGroup := 0, "HRESULT")
        return IContactAggregationGroup(ppGroup)
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
        if (IContactAggregationGroupCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.FindFirst := CallbackCreate(GetMethod(implObj, "FindFirst"), flags, 2)
        this.vtbl.FindFirstByGlobalObjectId := CallbackCreate(GetMethod(implObj, "FindFirstByGlobalObjectId"), flags, 3)
        this.vtbl.FindNext := CallbackCreate(GetMethod(implObj, "FindNext"), flags, 2)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.FindFirst)
        CallbackFree(this.vtbl.FindFirstByGlobalObjectId)
        CallbackFree(this.vtbl.FindNext)
        CallbackFree(this.vtbl.get_Count)
    }
}
