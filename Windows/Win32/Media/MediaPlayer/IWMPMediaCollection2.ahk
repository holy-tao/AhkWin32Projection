#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWMPQuery.ahk
#Include .\IWMPPlaylist.ahk
#Include .\IWMPStringCollection.ahk
#Include .\IWMPMediaCollection.ahk

/**
 * The IWMPMediaCollection2 interface provides methods that supplement the IWMPMediaCollection interface.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpmediacollection2
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPMediaCollection2 extends IWMPMediaCollection{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPMediaCollection2
     * @type {Guid}
     */
    static IID => Guid("{8ba957f5-fd8c-4791-b82d-f840401ee474}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 19

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["createQuery", "getPlaylistByQuery", "getStringCollectionByQuery", "getByAttributeAndMediaType"]

    /**
     * The createQuery method retrieves a pointer to an IWMPQuery interface that represents a new query.
     * @returns {IWMPQuery} Address of a variable that receives an <b>IWMPQuery</b> pointer to the new, empty query.
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpmediacollection2-createquery
     */
    createQuery() {
        result := ComCall(19, this, "ptr*", &ppQuery := 0, "HRESULT")
        return IWMPQuery(ppQuery)
    }

    /**
     * The getPlaylistByQuery method retrieves a pointer to an IWMPPlaylist interface. This interface represents a playlist that contains media items that match the query conditions.
     * @param {IWMPQuery} pQuery Pointer to the <b>IWMPQuery</b> interface that represents the query.
     * @param {BSTR} bstrMediaType 
     * @param {BSTR} bstrSortAttribute String that contains the attribute name used for sorting. An empty string means that no sorting is applied.
     * @param {VARIANT_BOOL} fSortAscending <b>VARIANT_BOOL</b> that indicates whether the playlist must be sorted in ascending order.
     * @returns {IWMPPlaylist} Address of a variable that receives a pointer to an <b>IWMPPlaylist</b> interface for the retrieved playlist.
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpmediacollection2-getplaylistbyquery
     */
    getPlaylistByQuery(pQuery, bstrMediaType, bstrSortAttribute, fSortAscending) {
        bstrMediaType := bstrMediaType is String ? BSTR.Alloc(bstrMediaType).Value : bstrMediaType
        bstrSortAttribute := bstrSortAttribute is String ? BSTR.Alloc(bstrSortAttribute).Value : bstrSortAttribute

        result := ComCall(20, this, "ptr", pQuery, "ptr", bstrMediaType, "ptr", bstrSortAttribute, "short", fSortAscending, "ptr*", &ppPlaylist := 0, "HRESULT")
        return IWMPPlaylist(ppPlaylist)
    }

    /**
     * The getStringCollectionByQuery method retrieves a pointer to an IWMPStringCollection interface. This interface represents a set of all string values for a specified attribute that match the query conditions.
     * @param {BSTR} bstrAttribute String containing the attribute name.
     * @param {IWMPQuery} pQuery Pointer to the <b>IWMPQuery</b> interface that represents the query that defines the conditions used to retrieve the string collection.
     * @param {BSTR} bstrMediaType 
     * @param {BSTR} bstrSortAttribute String containing the attribute name used for sorting. An empty string means no sorting is applied.
     * @param {VARIANT_BOOL} fSortAscending <b>VARIANT_BOOL</b> that indicates whether the playlist must be sorted in ascending order.
     * @returns {IWMPStringCollection} Address of a variable that receives a pointer to an <b>IWMPStringCollection</b> interface for the retrieved set of string values.
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpmediacollection2-getstringcollectionbyquery
     */
    getStringCollectionByQuery(bstrAttribute, pQuery, bstrMediaType, bstrSortAttribute, fSortAscending) {
        bstrAttribute := bstrAttribute is String ? BSTR.Alloc(bstrAttribute).Value : bstrAttribute
        bstrMediaType := bstrMediaType is String ? BSTR.Alloc(bstrMediaType).Value : bstrMediaType
        bstrSortAttribute := bstrSortAttribute is String ? BSTR.Alloc(bstrSortAttribute).Value : bstrSortAttribute

        result := ComCall(21, this, "ptr", bstrAttribute, "ptr", pQuery, "ptr", bstrMediaType, "ptr", bstrSortAttribute, "short", fSortAscending, "ptr*", &ppStringCollection := 0, "HRESULT")
        return IWMPStringCollection(ppStringCollection)
    }

    /**
     * The getByAttributeAndMediaType method retrieves a pointer to an IWMPPlaylist interface. This interface represents a playlist that contains media items that have a specified attribute and media type.
     * @param {BSTR} bstrAttribute String that contains the specified attribute.
     * @param {BSTR} bstrValue String that contains the specified value for the attribute that is specified in <i>bstrAttribute</i>.
     * @param {BSTR} bstrMediaType String that contains the specified media type.
     * @returns {IWMPPlaylist} Address of a variable that receives a pointer to an <b>IWMPPlaylist</b> interface for the retrieved playlist.
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpmediacollection2-getbyattributeandmediatype
     */
    getByAttributeAndMediaType(bstrAttribute, bstrValue, bstrMediaType) {
        bstrAttribute := bstrAttribute is String ? BSTR.Alloc(bstrAttribute).Value : bstrAttribute
        bstrValue := bstrValue is String ? BSTR.Alloc(bstrValue).Value : bstrValue
        bstrMediaType := bstrMediaType is String ? BSTR.Alloc(bstrMediaType).Value : bstrMediaType

        result := ComCall(22, this, "ptr", bstrAttribute, "ptr", bstrValue, "ptr", bstrMediaType, "ptr*", &ppMediaItems := 0, "HRESULT")
        return IWMPPlaylist(ppMediaItems)
    }
}
