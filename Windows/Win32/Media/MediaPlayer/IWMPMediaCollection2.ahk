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
 * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nn-wmp-iwmpmediacollection2
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
     * @remarks
     * Creating a new query is the first step toward creating a compound query.
     * 
     * <b>Windows Media Player 10 Mobile:</b> This method is not supported.
     * @returns {IWMPQuery} Address of a variable that receives an <b>IWMPQuery</b> pointer to the new, empty query.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpmediacollection2-createquery
     */
    createQuery() {
        result := ComCall(19, this, "ptr*", &ppQuery := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpmediacollection2-getplaylistbyquery
     */
    getPlaylistByQuery(pQuery, bstrMediaType, bstrSortAttribute, fSortAscending) {
        if(bstrMediaType is String) {
            pin := BSTR.Alloc(bstrMediaType)
            bstrMediaType := pin.Value
        }
        if(bstrSortAttribute is String) {
            pin := BSTR.Alloc(bstrSortAttribute)
            bstrSortAttribute := pin.Value
        }

        result := ComCall(20, this, "ptr", pQuery, "ptr", bstrMediaType, "ptr", bstrSortAttribute, "short", fSortAscending, "ptr*", &ppPlaylist := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpmediacollection2-getstringcollectionbyquery
     */
    getStringCollectionByQuery(bstrAttribute, pQuery, bstrMediaType, bstrSortAttribute, fSortAscending) {
        if(bstrAttribute is String) {
            pin := BSTR.Alloc(bstrAttribute)
            bstrAttribute := pin.Value
        }
        if(bstrMediaType is String) {
            pin := BSTR.Alloc(bstrMediaType)
            bstrMediaType := pin.Value
        }
        if(bstrSortAttribute is String) {
            pin := BSTR.Alloc(bstrSortAttribute)
            bstrSortAttribute := pin.Value
        }

        result := ComCall(21, this, "ptr", bstrAttribute, "ptr", pQuery, "ptr", bstrMediaType, "ptr", bstrSortAttribute, "short", fSortAscending, "ptr*", &ppStringCollection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpmediacollection2-getbyattributeandmediatype
     */
    getByAttributeAndMediaType(bstrAttribute, bstrValue, bstrMediaType) {
        if(bstrAttribute is String) {
            pin := BSTR.Alloc(bstrAttribute)
            bstrAttribute := pin.Value
        }
        if(bstrValue is String) {
            pin := BSTR.Alloc(bstrValue)
            bstrValue := pin.Value
        }
        if(bstrMediaType is String) {
            pin := BSTR.Alloc(bstrMediaType)
            bstrMediaType := pin.Value
        }

        result := ComCall(22, this, "ptr", bstrAttribute, "ptr", bstrValue, "ptr", bstrMediaType, "ptr*", &ppMediaItems := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWMPPlaylist(ppMediaItems)
    }
}
