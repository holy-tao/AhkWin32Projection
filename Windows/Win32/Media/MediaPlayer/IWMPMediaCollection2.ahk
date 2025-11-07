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
     * 
     * @returns {IWMPQuery} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmediacollection2-createquery
     */
    createQuery() {
        result := ComCall(19, this, "ptr*", &ppQuery := 0, "HRESULT")
        return IWMPQuery(ppQuery)
    }

    /**
     * 
     * @param {IWMPQuery} pQuery 
     * @param {BSTR} bstrMediaType 
     * @param {BSTR} bstrSortAttribute 
     * @param {VARIANT_BOOL} fSortAscending 
     * @returns {IWMPPlaylist} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmediacollection2-getplaylistbyquery
     */
    getPlaylistByQuery(pQuery, bstrMediaType, bstrSortAttribute, fSortAscending) {
        bstrMediaType := bstrMediaType is String ? BSTR.Alloc(bstrMediaType).Value : bstrMediaType
        bstrSortAttribute := bstrSortAttribute is String ? BSTR.Alloc(bstrSortAttribute).Value : bstrSortAttribute

        result := ComCall(20, this, "ptr", pQuery, "ptr", bstrMediaType, "ptr", bstrSortAttribute, "short", fSortAscending, "ptr*", &ppPlaylist := 0, "HRESULT")
        return IWMPPlaylist(ppPlaylist)
    }

    /**
     * 
     * @param {BSTR} bstrAttribute 
     * @param {IWMPQuery} pQuery 
     * @param {BSTR} bstrMediaType 
     * @param {BSTR} bstrSortAttribute 
     * @param {VARIANT_BOOL} fSortAscending 
     * @returns {IWMPStringCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmediacollection2-getstringcollectionbyquery
     */
    getStringCollectionByQuery(bstrAttribute, pQuery, bstrMediaType, bstrSortAttribute, fSortAscending) {
        bstrAttribute := bstrAttribute is String ? BSTR.Alloc(bstrAttribute).Value : bstrAttribute
        bstrMediaType := bstrMediaType is String ? BSTR.Alloc(bstrMediaType).Value : bstrMediaType
        bstrSortAttribute := bstrSortAttribute is String ? BSTR.Alloc(bstrSortAttribute).Value : bstrSortAttribute

        result := ComCall(21, this, "ptr", bstrAttribute, "ptr", pQuery, "ptr", bstrMediaType, "ptr", bstrSortAttribute, "short", fSortAscending, "ptr*", &ppStringCollection := 0, "HRESULT")
        return IWMPStringCollection(ppStringCollection)
    }

    /**
     * 
     * @param {BSTR} bstrAttribute 
     * @param {BSTR} bstrValue 
     * @param {BSTR} bstrMediaType 
     * @returns {IWMPPlaylist} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmediacollection2-getbyattributeandmediatype
     */
    getByAttributeAndMediaType(bstrAttribute, bstrValue, bstrMediaType) {
        bstrAttribute := bstrAttribute is String ? BSTR.Alloc(bstrAttribute).Value : bstrAttribute
        bstrValue := bstrValue is String ? BSTR.Alloc(bstrValue).Value : bstrValue
        bstrMediaType := bstrMediaType is String ? BSTR.Alloc(bstrMediaType).Value : bstrMediaType

        result := ComCall(22, this, "ptr", bstrAttribute, "ptr", bstrValue, "ptr", bstrMediaType, "ptr*", &ppMediaItems := 0, "HRESULT")
        return IWMPPlaylist(ppMediaItems)
    }
}
