#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\CONTACT_AGGREGATION_COLLECTION_OPTIONS.ahk" { CONTACT_AGGREGATION_COLLECTION_OPTIONS }
#Import ".\IContactAggregationContactCollection.ahk" { IContactAggregationContactCollection }
#Import ".\IContactAggregationGroupCollection.ahk" { IContactAggregationGroupCollection }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Contacts
 */
export default struct IContactAggregationAggregate extends IUnknown {
    /**
     * The interface identifier for IContactAggregationAggregate
     * @type {Guid}
     */
    static IID := Guid("{7ed1c814-cd30-43c8-9b8d-2e489e53d54b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IContactAggregationAggregate interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Save              : IntPtr
        GetComponentItems : IntPtr
        Link              : IntPtr
        get_Groups        : IntPtr
        get_AntiLink      : IntPtr
        put_AntiLink      : IntPtr
        get_FavoriteOrder : IntPtr
        put_FavoriteOrder : IntPtr
        get_Id            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IContactAggregationAggregate.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {PWSTR} 
     */
    AntiLink {
        get => this.get_AntiLink()
        set => this.put_AntiLink(value)
    }

    /**
     * @type {Integer} 
     */
    FavoriteOrder {
        get => this.get_FavoriteOrder()
        set => this.put_FavoriteOrder(value)
    }

    /**
     * @type {PWSTR} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Save() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IContactAggregationContactCollection} 
     */
    GetComponentItems() {
        result := ComCall(4, this, "ptr*", &pComponentItems := 0, "HRESULT")
        return IContactAggregationContactCollection(pComponentItems)
    }

    /**
     * 
     * @param {PWSTR} pAggregateId 
     * @returns {HRESULT} 
     */
    Link(pAggregateId) {
        pAggregateId := pAggregateId is String ? StrPtr(pAggregateId) : pAggregateId

        result := ComCall(5, this, "ptr", pAggregateId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {CONTACT_AGGREGATION_COLLECTION_OPTIONS} options 
     * @returns {IContactAggregationGroupCollection} 
     */
    get_Groups(options) {
        result := ComCall(6, this, CONTACT_AGGREGATION_COLLECTION_OPTIONS, options, "ptr*", &ppGroups := 0, "HRESULT")
        return IContactAggregationGroupCollection(ppGroups)
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    get_AntiLink() {
        result := ComCall(7, this, PWSTR.Ptr, &ppAntiLink := 0, "HRESULT")
        return ppAntiLink
    }

    /**
     * 
     * @param {PWSTR} pAntiLink 
     * @returns {HRESULT} 
     */
    put_AntiLink(pAntiLink) {
        pAntiLink := pAntiLink is String ? StrPtr(pAntiLink) : pAntiLink

        result := ComCall(8, this, "ptr", pAntiLink, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FavoriteOrder() {
        result := ComCall(9, this, "uint*", &pFavoriteOrder := 0, "HRESULT")
        return pFavoriteOrder
    }

    /**
     * 
     * @param {Integer} favoriteOrder 
     * @returns {HRESULT} 
     */
    put_FavoriteOrder(favoriteOrder) {
        result := ComCall(10, this, "uint", favoriteOrder, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    get_Id() {
        result := ComCall(11, this, PWSTR.Ptr, &ppItemId := 0, "HRESULT")
        return ppItemId
    }

    Query(iid) {
        if (IContactAggregationAggregate.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Save := CallbackCreate(GetMethod(implObj, "Save"), flags, 1)
        this.vtbl.GetComponentItems := CallbackCreate(GetMethod(implObj, "GetComponentItems"), flags, 2)
        this.vtbl.Link := CallbackCreate(GetMethod(implObj, "Link"), flags, 2)
        this.vtbl.get_Groups := CallbackCreate(GetMethod(implObj, "get_Groups"), flags, 3)
        this.vtbl.get_AntiLink := CallbackCreate(GetMethod(implObj, "get_AntiLink"), flags, 2)
        this.vtbl.put_AntiLink := CallbackCreate(GetMethod(implObj, "put_AntiLink"), flags, 2)
        this.vtbl.get_FavoriteOrder := CallbackCreate(GetMethod(implObj, "get_FavoriteOrder"), flags, 2)
        this.vtbl.put_FavoriteOrder := CallbackCreate(GetMethod(implObj, "put_FavoriteOrder"), flags, 2)
        this.vtbl.get_Id := CallbackCreate(GetMethod(implObj, "get_Id"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Save)
        CallbackFree(this.vtbl.GetComponentItems)
        CallbackFree(this.vtbl.Link)
        CallbackFree(this.vtbl.get_Groups)
        CallbackFree(this.vtbl.get_AntiLink)
        CallbackFree(this.vtbl.put_AntiLink)
        CallbackFree(this.vtbl.get_FavoriteOrder)
        CallbackFree(this.vtbl.put_FavoriteOrder)
        CallbackFree(this.vtbl.get_Id)
    }
}
