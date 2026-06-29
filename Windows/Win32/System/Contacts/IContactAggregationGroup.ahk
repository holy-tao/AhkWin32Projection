#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IContactAggregationAggregateCollection.ahk" { IContactAggregationAggregateCollection }

/**
 * @namespace Windows.Win32.System.Contacts
 */
export default struct IContactAggregationGroup extends IUnknown {
    /**
     * The interface identifier for IContactAggregationGroup
     * @type {Guid}
     */
    static IID := Guid("{c93c545f-1284-499b-96af-07372af473e0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IContactAggregationGroup interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Delete             : IntPtr
        Save               : IntPtr
        Add                : IntPtr
        Remove             : IntPtr
        get_Members        : IntPtr
        get_GlobalObjectId : IntPtr
        put_GlobalObjectId : IntPtr
        get_Id             : IntPtr
        get_Name           : IntPtr
        put_Name           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IContactAggregationGroup.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IContactAggregationAggregateCollection} 
     */
    Members {
        get => this.get_Members()
    }

    /**
     * @type {Guid} 
     */
    GlobalObjectId {
        get => this.get_GlobalObjectId()
        set => this.put_GlobalObjectId(value)
    }

    /**
     * @type {PWSTR} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {PWSTR} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
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
    Add(pAggregateId) {
        pAggregateId := pAggregateId is String ? StrPtr(pAggregateId) : pAggregateId

        result := ComCall(5, this, "ptr", pAggregateId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pAggregateId 
     * @returns {HRESULT} 
     */
    Remove(pAggregateId) {
        pAggregateId := pAggregateId is String ? StrPtr(pAggregateId) : pAggregateId

        result := ComCall(6, this, "ptr", pAggregateId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IContactAggregationAggregateCollection} 
     */
    get_Members() {
        result := ComCall(7, this, "ptr*", &ppAggregateContactCollection := 0, "HRESULT")
        return IContactAggregationAggregateCollection(ppAggregateContactCollection)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_GlobalObjectId() {
        pGlobalObjectId := Guid()
        result := ComCall(8, this, Guid.Ptr, pGlobalObjectId, "HRESULT")
        return pGlobalObjectId
    }

    /**
     * 
     * @param {Pointer<Guid>} pGlobalObjectId 
     * @returns {HRESULT} 
     */
    put_GlobalObjectId(pGlobalObjectId) {
        result := ComCall(9, this, Guid.Ptr, pGlobalObjectId, "HRESULT")
        return result
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
     * @returns {PWSTR} 
     */
    get_Name() {
        result := ComCall(11, this, PWSTR.Ptr, &ppName := 0, "HRESULT")
        return ppName
    }

    /**
     * 
     * @param {PWSTR} pName 
     * @returns {HRESULT} 
     */
    put_Name(pName) {
        pName := pName is String ? StrPtr(pName) : pName

        result := ComCall(12, this, "ptr", pName, "HRESULT")
        return result
    }

    Query(iid) {
        if (IContactAggregationGroup.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Delete := CallbackCreate(GetMethod(implObj, "Delete"), flags, 1)
        this.vtbl.Save := CallbackCreate(GetMethod(implObj, "Save"), flags, 1)
        this.vtbl.Add := CallbackCreate(GetMethod(implObj, "Add"), flags, 2)
        this.vtbl.Remove := CallbackCreate(GetMethod(implObj, "Remove"), flags, 2)
        this.vtbl.get_Members := CallbackCreate(GetMethod(implObj, "get_Members"), flags, 2)
        this.vtbl.get_GlobalObjectId := CallbackCreate(GetMethod(implObj, "get_GlobalObjectId"), flags, 2)
        this.vtbl.put_GlobalObjectId := CallbackCreate(GetMethod(implObj, "put_GlobalObjectId"), flags, 2)
        this.vtbl.get_Id := CallbackCreate(GetMethod(implObj, "get_Id"), flags, 2)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.put_Name := CallbackCreate(GetMethod(implObj, "put_Name"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Delete)
        CallbackFree(this.vtbl.Save)
        CallbackFree(this.vtbl.Add)
        CallbackFree(this.vtbl.Remove)
        CallbackFree(this.vtbl.get_Members)
        CallbackFree(this.vtbl.get_GlobalObjectId)
        CallbackFree(this.vtbl.put_GlobalObjectId)
        CallbackFree(this.vtbl.get_Id)
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.put_Name)
    }
}
