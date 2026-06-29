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
export default struct IContactAggregationServerPerson extends IUnknown {
    /**
     * The interface identifier for IContactAggregationServerPerson
     * @type {Guid}
     */
    static IID := Guid("{7fdc3d4b-1b82-4334-85c5-25184ee5a5f2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IContactAggregationServerPerson interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Delete                    : IntPtr
        Save                      : IntPtr
        get_AggregateId           : IntPtr
        put_AggregateId           : IntPtr
        get_AntiLink              : IntPtr
        put_AntiLink              : IntPtr
        get_AntiLinkBaseline      : IntPtr
        put_AntiLinkBaseline      : IntPtr
        get_FavoriteOrder         : IntPtr
        put_FavoriteOrder         : IntPtr
        get_FavoriteOrderBaseline : IntPtr
        put_FavoriteOrderBaseline : IntPtr
        get_Groups                : IntPtr
        put_Groups                : IntPtr
        get_GroupsBaseline        : IntPtr
        put_GroupsBaseline        : IntPtr
        get_Id                    : IntPtr
        get_IsTombstone           : IntPtr
        put_IsTombstone           : IntPtr
        get_LinkedAggregateId     : IntPtr
        put_LinkedAggregateId     : IntPtr
        get_ObjectId              : IntPtr
        put_ObjectId              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IContactAggregationServerPerson.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {PWSTR} 
     */
    AggregateId {
        get => this.get_AggregateId()
        set => this.put_AggregateId(value)
    }

    /**
     * @type {PWSTR} 
     */
    AntiLink {
        get => this.get_AntiLink()
        set => this.put_AntiLink(value)
    }

    /**
     * @type {PWSTR} 
     */
    AntiLinkBaseline {
        get => this.get_AntiLinkBaseline()
        set => this.put_AntiLinkBaseline(value)
    }

    /**
     * @type {Integer} 
     */
    FavoriteOrder {
        get => this.get_FavoriteOrder()
        set => this.put_FavoriteOrder(value)
    }

    /**
     * @type {Integer} 
     */
    FavoriteOrderBaseline {
        get => this.get_FavoriteOrderBaseline()
        set => this.put_FavoriteOrderBaseline(value)
    }

    /**
     * @type {Pointer<CONTACT_AGGREGATION_BLOB>} 
     */
    Groups {
        get => this.get_Groups()
        set => this.put_Groups(value)
    }

    /**
     * @type {Pointer<CONTACT_AGGREGATION_BLOB>} 
     */
    GroupsBaseline {
        get => this.get_GroupsBaseline()
        set => this.put_GroupsBaseline(value)
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
    IsTombstone {
        get => this.get_IsTombstone()
        set => this.put_IsTombstone(value)
    }

    /**
     * @type {PWSTR} 
     */
    LinkedAggregateId {
        get => this.get_LinkedAggregateId()
        set => this.put_LinkedAggregateId(value)
    }

    /**
     * @type {PWSTR} 
     */
    ObjectId {
        get => this.get_ObjectId()
        set => this.put_ObjectId(value)
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
    get_AggregateId() {
        result := ComCall(5, this, PWSTR.Ptr, &ppAggregateId := 0, "HRESULT")
        return ppAggregateId
    }

    /**
     * 
     * @param {PWSTR} pAggregateId 
     * @returns {HRESULT} 
     */
    put_AggregateId(pAggregateId) {
        pAggregateId := pAggregateId is String ? StrPtr(pAggregateId) : pAggregateId

        result := ComCall(6, this, "ptr", pAggregateId, "HRESULT")
        return result
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
     * @returns {PWSTR} 
     */
    get_AntiLinkBaseline() {
        result := ComCall(9, this, PWSTR.Ptr, &ppAntiLink := 0, "HRESULT")
        return ppAntiLink
    }

    /**
     * 
     * @param {PWSTR} pAntiLink 
     * @returns {HRESULT} 
     */
    put_AntiLinkBaseline(pAntiLink) {
        pAntiLink := pAntiLink is String ? StrPtr(pAntiLink) : pAntiLink

        result := ComCall(10, this, "ptr", pAntiLink, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FavoriteOrder() {
        result := ComCall(11, this, "uint*", &pFavoriteOrder := 0, "HRESULT")
        return pFavoriteOrder
    }

    /**
     * 
     * @param {Integer} favoriteOrder 
     * @returns {HRESULT} 
     */
    put_FavoriteOrder(favoriteOrder) {
        result := ComCall(12, this, "uint", favoriteOrder, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FavoriteOrderBaseline() {
        result := ComCall(13, this, "uint*", &pFavoriteOrder := 0, "HRESULT")
        return pFavoriteOrder
    }

    /**
     * 
     * @param {Integer} favoriteOrder 
     * @returns {HRESULT} 
     */
    put_FavoriteOrderBaseline(favoriteOrder) {
        result := ComCall(14, this, "uint", favoriteOrder, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer<CONTACT_AGGREGATION_BLOB>} 
     */
    get_Groups() {
        result := ComCall(15, this, "ptr*", &pGroups := 0, "HRESULT")
        return pGroups
    }

    /**
     * 
     * @param {Pointer<CONTACT_AGGREGATION_BLOB>} pGroups 
     * @returns {HRESULT} 
     */
    put_Groups(pGroups) {
        result := ComCall(16, this, CONTACT_AGGREGATION_BLOB.Ptr, pGroups, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer<CONTACT_AGGREGATION_BLOB>} 
     */
    get_GroupsBaseline() {
        result := ComCall(17, this, "ptr*", &ppGroups := 0, "HRESULT")
        return ppGroups
    }

    /**
     * 
     * @param {Pointer<CONTACT_AGGREGATION_BLOB>} pGroups 
     * @returns {HRESULT} 
     */
    put_GroupsBaseline(pGroups) {
        result := ComCall(18, this, CONTACT_AGGREGATION_BLOB.Ptr, pGroups, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    get_Id() {
        result := ComCall(19, this, PWSTR.Ptr, &ppId := 0, "HRESULT")
        return ppId
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsTombstone() {
        result := ComCall(20, this, BOOL.Ptr, &pIsTombstone := 0, "HRESULT")
        return pIsTombstone
    }

    /**
     * 
     * @param {BOOL} isTombstone 
     * @returns {HRESULT} 
     */
    put_IsTombstone(isTombstone) {
        result := ComCall(21, this, BOOL, isTombstone, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    get_LinkedAggregateId() {
        result := ComCall(22, this, PWSTR.Ptr, &ppLinkedAggregateId := 0, "HRESULT")
        return ppLinkedAggregateId
    }

    /**
     * 
     * @param {PWSTR} pLinkedAggregateId 
     * @returns {HRESULT} 
     */
    put_LinkedAggregateId(pLinkedAggregateId) {
        pLinkedAggregateId := pLinkedAggregateId is String ? StrPtr(pLinkedAggregateId) : pLinkedAggregateId

        result := ComCall(23, this, "ptr", pLinkedAggregateId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    get_ObjectId() {
        result := ComCall(24, this, PWSTR.Ptr, &ppObjectId := 0, "HRESULT")
        return ppObjectId
    }

    /**
     * 
     * @param {PWSTR} pObjectId 
     * @returns {HRESULT} 
     */
    put_ObjectId(pObjectId) {
        pObjectId := pObjectId is String ? StrPtr(pObjectId) : pObjectId

        result := ComCall(25, this, "ptr", pObjectId, "HRESULT")
        return result
    }

    Query(iid) {
        if (IContactAggregationServerPerson.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Delete := CallbackCreate(GetMethod(implObj, "Delete"), flags, 1)
        this.vtbl.Save := CallbackCreate(GetMethod(implObj, "Save"), flags, 1)
        this.vtbl.get_AggregateId := CallbackCreate(GetMethod(implObj, "get_AggregateId"), flags, 2)
        this.vtbl.put_AggregateId := CallbackCreate(GetMethod(implObj, "put_AggregateId"), flags, 2)
        this.vtbl.get_AntiLink := CallbackCreate(GetMethod(implObj, "get_AntiLink"), flags, 2)
        this.vtbl.put_AntiLink := CallbackCreate(GetMethod(implObj, "put_AntiLink"), flags, 2)
        this.vtbl.get_AntiLinkBaseline := CallbackCreate(GetMethod(implObj, "get_AntiLinkBaseline"), flags, 2)
        this.vtbl.put_AntiLinkBaseline := CallbackCreate(GetMethod(implObj, "put_AntiLinkBaseline"), flags, 2)
        this.vtbl.get_FavoriteOrder := CallbackCreate(GetMethod(implObj, "get_FavoriteOrder"), flags, 2)
        this.vtbl.put_FavoriteOrder := CallbackCreate(GetMethod(implObj, "put_FavoriteOrder"), flags, 2)
        this.vtbl.get_FavoriteOrderBaseline := CallbackCreate(GetMethod(implObj, "get_FavoriteOrderBaseline"), flags, 2)
        this.vtbl.put_FavoriteOrderBaseline := CallbackCreate(GetMethod(implObj, "put_FavoriteOrderBaseline"), flags, 2)
        this.vtbl.get_Groups := CallbackCreate(GetMethod(implObj, "get_Groups"), flags, 2)
        this.vtbl.put_Groups := CallbackCreate(GetMethod(implObj, "put_Groups"), flags, 2)
        this.vtbl.get_GroupsBaseline := CallbackCreate(GetMethod(implObj, "get_GroupsBaseline"), flags, 2)
        this.vtbl.put_GroupsBaseline := CallbackCreate(GetMethod(implObj, "put_GroupsBaseline"), flags, 2)
        this.vtbl.get_Id := CallbackCreate(GetMethod(implObj, "get_Id"), flags, 2)
        this.vtbl.get_IsTombstone := CallbackCreate(GetMethod(implObj, "get_IsTombstone"), flags, 2)
        this.vtbl.put_IsTombstone := CallbackCreate(GetMethod(implObj, "put_IsTombstone"), flags, 2)
        this.vtbl.get_LinkedAggregateId := CallbackCreate(GetMethod(implObj, "get_LinkedAggregateId"), flags, 2)
        this.vtbl.put_LinkedAggregateId := CallbackCreate(GetMethod(implObj, "put_LinkedAggregateId"), flags, 2)
        this.vtbl.get_ObjectId := CallbackCreate(GetMethod(implObj, "get_ObjectId"), flags, 2)
        this.vtbl.put_ObjectId := CallbackCreate(GetMethod(implObj, "put_ObjectId"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Delete)
        CallbackFree(this.vtbl.Save)
        CallbackFree(this.vtbl.get_AggregateId)
        CallbackFree(this.vtbl.put_AggregateId)
        CallbackFree(this.vtbl.get_AntiLink)
        CallbackFree(this.vtbl.put_AntiLink)
        CallbackFree(this.vtbl.get_AntiLinkBaseline)
        CallbackFree(this.vtbl.put_AntiLinkBaseline)
        CallbackFree(this.vtbl.get_FavoriteOrder)
        CallbackFree(this.vtbl.put_FavoriteOrder)
        CallbackFree(this.vtbl.get_FavoriteOrderBaseline)
        CallbackFree(this.vtbl.put_FavoriteOrderBaseline)
        CallbackFree(this.vtbl.get_Groups)
        CallbackFree(this.vtbl.put_Groups)
        CallbackFree(this.vtbl.get_GroupsBaseline)
        CallbackFree(this.vtbl.put_GroupsBaseline)
        CallbackFree(this.vtbl.get_Id)
        CallbackFree(this.vtbl.get_IsTombstone)
        CallbackFree(this.vtbl.put_IsTombstone)
        CallbackFree(this.vtbl.get_LinkedAggregateId)
        CallbackFree(this.vtbl.put_LinkedAggregateId)
        CallbackFree(this.vtbl.get_ObjectId)
        CallbackFree(this.vtbl.put_ObjectId)
    }
}
