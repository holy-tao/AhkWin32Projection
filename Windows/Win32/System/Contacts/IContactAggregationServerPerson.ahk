#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Contacts
 * @version v4.0.30319
 */
class IContactAggregationServerPerson extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactAggregationServerPerson
     * @type {Guid}
     */
    static IID => Guid("{7fdc3d4b-1b82-4334-85c5-25184ee5a5f2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Delete", "Save", "get_AggregateId", "put_AggregateId", "get_AntiLink", "put_AntiLink", "get_AntiLinkBaseline", "put_AntiLinkBaseline", "get_FavoriteOrder", "put_FavoriteOrder", "get_FavoriteOrderBaseline", "put_FavoriteOrderBaseline", "get_Groups", "put_Groups", "get_GroupsBaseline", "put_GroupsBaseline", "get_Id", "get_IsTombstone", "put_IsTombstone", "get_LinkedAggregateId", "put_LinkedAggregateId", "get_ObjectId", "put_ObjectId"]

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
        result := ComCall(5, this, "ptr*", &ppAggregateId := 0, "HRESULT")
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
        result := ComCall(7, this, "ptr*", &ppAntiLink := 0, "HRESULT")
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
        result := ComCall(9, this, "ptr*", &ppAntiLink := 0, "HRESULT")
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
        result := ComCall(16, this, "ptr", pGroups, "HRESULT")
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
        result := ComCall(18, this, "ptr", pGroups, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    get_Id() {
        result := ComCall(19, this, "ptr*", &ppId := 0, "HRESULT")
        return ppId
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsTombstone() {
        result := ComCall(20, this, "int*", &pIsTombstone := 0, "HRESULT")
        return pIsTombstone
    }

    /**
     * 
     * @param {BOOL} isTombstone 
     * @returns {HRESULT} 
     */
    put_IsTombstone(isTombstone) {
        result := ComCall(21, this, "int", isTombstone, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    get_LinkedAggregateId() {
        result := ComCall(22, this, "ptr*", &ppLinkedAggregateId := 0, "HRESULT")
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
        result := ComCall(24, this, "ptr*", &ppObjectId := 0, "HRESULT")
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
}
