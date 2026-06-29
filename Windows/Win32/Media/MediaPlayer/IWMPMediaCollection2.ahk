#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IWMPMediaCollection.ahk" { IWMPMediaCollection }
#Import ".\IWMPPlaylist.ahk" { IWMPPlaylist }
#Import ".\IWMPStringCollection.ahk" { IWMPStringCollection }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IWMPQuery.ahk" { IWMPQuery }

/**
 * The IWMPMediaCollection2 interface provides methods that supplement the IWMPMediaCollection interface.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpmediacollection2
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPMediaCollection2 extends IWMPMediaCollection {
    /**
     * The interface identifier for IWMPMediaCollection2
     * @type {Guid}
     */
    static IID := Guid("{8ba957f5-fd8c-4791-b82d-f840401ee474}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPMediaCollection2 interfaces
    */
    struct Vtbl extends IWMPMediaCollection.Vtbl {
        createQuery                : IntPtr
        getPlaylistByQuery         : IntPtr
        getStringCollectionByQuery : IntPtr
        getByAttributeAndMediaType : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPMediaCollection2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The createQuery method retrieves a pointer to an IWMPQuery interface that represents a new query.
     * @remarks
     * Creating a new query is the first step toward creating a compound query.
     * 
     * <b>Windows Media Player 10 Mobile:</b> This method is not supported.
     * @returns {IWMPQuery} Address of a variable that receives an <b>IWMPQuery</b> pointer to the new, empty query.
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmediacollection2-createquery
     */
    createQuery() {
        result := ComCall(19, this, "ptr*", &ppQuery := 0, "HRESULT")
        return IWMPQuery(ppQuery)
    }

    /**
     * The getPlaylistByQuery method retrieves a pointer to an IWMPPlaylist interface. This interface represents a playlist that contains media items that match the query conditions.
     * @remarks
     * Compound queries using <b>IWMPQuery</b> are not case sensitive.
     * 
     * When the compound query specified by the <i>pQuery</i> parameter contains a condition built on the <b>MediaType</b> attribute, that condition is ignored. The value for the <i>bstrMediaType</i> parameter is always used. For example, if the compound query contains the condition "MediaType Equals audio" and the value for the <i>bstrMediaType</i> parameter is "video", the resulting playlist will contain only video items.
     * 
     * <b>Windows Media Player 10 Mobile:</b> This method is not supported.
     * @param {IWMPQuery} pQuery Pointer to the <b>IWMPQuery</b> interface that represents the query.
     * @param {BSTR} bstrMediaType 
     * @param {BSTR} bstrSortAttribute String that contains the attribute name used for sorting. An empty string means that no sorting is applied.
     * @param {VARIANT_BOOL} fSortAscending <b>VARIANT_BOOL</b> that indicates whether the playlist must be sorted in ascending order.
     * @returns {IWMPPlaylist} Address of a variable that receives a pointer to an <b>IWMPPlaylist</b> interface for the retrieved playlist.
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmediacollection2-getplaylistbyquery
     */
    getPlaylistByQuery(pQuery, bstrMediaType, bstrSortAttribute, fSortAscending) {
        bstrMediaType := bstrMediaType is String ? BSTR.Alloc(bstrMediaType).Value : bstrMediaType
        bstrSortAttribute := bstrSortAttribute is String ? BSTR.Alloc(bstrSortAttribute).Value : bstrSortAttribute

        result := ComCall(20, this, "ptr", pQuery, BSTR, bstrMediaType, BSTR, bstrSortAttribute, VARIANT_BOOL, fSortAscending, "ptr*", &ppPlaylist := 0, "HRESULT")
        return IWMPPlaylist(ppPlaylist)
    }

    /**
     * The getStringCollectionByQuery method retrieves a pointer to an IWMPStringCollection interface. This interface represents a set of all string values for a specified attribute that match the query conditions.
     * @remarks
     * Compound queries using <b>IWMPQuery</b> are not case sensitive.
     * 
     * When the compound query specified by the <i>pQuery</i> parameter contains a condition built on the <b>MediaType</b> attribute, that condition is ignored. The value for the <i>bstrMediaType</i> parameter is always used. For example, if the compound query contains the condition "MediaType Equals audio" and the value for the <i>bstrMediaType</i> parameter is "video", the resulting playlist will contain only video items.
     * 
     * <b>Windows Media Player 10 Mobile:</b> This method is not supported.
     * @param {BSTR} bstrAttribute String containing the attribute name.
     * @param {IWMPQuery} pQuery Pointer to the <b>IWMPQuery</b> interface that represents the query that defines the conditions used to retrieve the string collection.
     * @param {BSTR} bstrMediaType 
     * @param {BSTR} bstrSortAttribute String containing the attribute name used for sorting. An empty string means no sorting is applied.
     * @param {VARIANT_BOOL} fSortAscending <b>VARIANT_BOOL</b> that indicates whether the playlist must be sorted in ascending order.
     * @returns {IWMPStringCollection} Address of a variable that receives a pointer to an <b>IWMPStringCollection</b> interface for the retrieved set of string values.
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmediacollection2-getstringcollectionbyquery
     */
    getStringCollectionByQuery(bstrAttribute, pQuery, bstrMediaType, bstrSortAttribute, fSortAscending) {
        bstrAttribute := bstrAttribute is String ? BSTR.Alloc(bstrAttribute).Value : bstrAttribute
        bstrMediaType := bstrMediaType is String ? BSTR.Alloc(bstrMediaType).Value : bstrMediaType
        bstrSortAttribute := bstrSortAttribute is String ? BSTR.Alloc(bstrSortAttribute).Value : bstrSortAttribute

        result := ComCall(21, this, BSTR, bstrAttribute, "ptr", pQuery, BSTR, bstrMediaType, BSTR, bstrSortAttribute, VARIANT_BOOL, fSortAscending, "ptr*", &ppStringCollection := 0, "HRESULT")
        return IWMPStringCollection(ppStringCollection)
    }

    /**
     * The getByAttributeAndMediaType method retrieves a pointer to an IWMPPlaylist interface. This interface represents a playlist that contains media items that have a specified attribute and media type.
     * @remarks
     * <b>Windows Media Player 10 Mobile:</b> This method is not supported.
     * @param {BSTR} bstrAttribute String that contains the specified attribute.
     * @param {BSTR} bstrValue String that contains the specified value for the attribute that is specified in <i>bstrAttribute</i>.
     * @param {BSTR} bstrMediaType String that contains the specified media type.
     * @returns {IWMPPlaylist} Address of a variable that receives a pointer to an <b>IWMPPlaylist</b> interface for the retrieved playlist.
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmediacollection2-getbyattributeandmediatype
     */
    getByAttributeAndMediaType(bstrAttribute, bstrValue, bstrMediaType) {
        bstrAttribute := bstrAttribute is String ? BSTR.Alloc(bstrAttribute).Value : bstrAttribute
        bstrValue := bstrValue is String ? BSTR.Alloc(bstrValue).Value : bstrValue
        bstrMediaType := bstrMediaType is String ? BSTR.Alloc(bstrMediaType).Value : bstrMediaType

        result := ComCall(22, this, BSTR, bstrAttribute, BSTR, bstrValue, BSTR, bstrMediaType, "ptr*", &ppMediaItems := 0, "HRESULT")
        return IWMPPlaylist(ppMediaItems)
    }

    Query(iid) {
        if (IWMPMediaCollection2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.createQuery := CallbackCreate(GetMethod(implObj, "createQuery"), flags, 2)
        this.vtbl.getPlaylistByQuery := CallbackCreate(GetMethod(implObj, "getPlaylistByQuery"), flags, 6)
        this.vtbl.getStringCollectionByQuery := CallbackCreate(GetMethod(implObj, "getStringCollectionByQuery"), flags, 7)
        this.vtbl.getByAttributeAndMediaType := CallbackCreate(GetMethod(implObj, "getByAttributeAndMediaType"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.createQuery)
        CallbackFree(this.vtbl.getPlaylistByQuery)
        CallbackFree(this.vtbl.getStringCollectionByQuery)
        CallbackFree(this.vtbl.getByAttributeAndMediaType)
    }
}
