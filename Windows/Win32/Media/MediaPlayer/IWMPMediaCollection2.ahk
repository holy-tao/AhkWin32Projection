#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @param {Pointer<IWMPQuery>} ppQuery 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmediacollection2-createquery
     */
    createQuery(ppQuery) {
        result := ComCall(19, this, "ptr*", ppQuery, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWMPQuery} pQuery 
     * @param {BSTR} bstrMediaType 
     * @param {BSTR} bstrSortAttribute 
     * @param {VARIANT_BOOL} fSortAscending 
     * @param {Pointer<IWMPPlaylist>} ppPlaylist 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmediacollection2-getplaylistbyquery
     */
    getPlaylistByQuery(pQuery, bstrMediaType, bstrSortAttribute, fSortAscending, ppPlaylist) {
        bstrMediaType := bstrMediaType is String ? BSTR.Alloc(bstrMediaType).Value : bstrMediaType
        bstrSortAttribute := bstrSortAttribute is String ? BSTR.Alloc(bstrSortAttribute).Value : bstrSortAttribute

        result := ComCall(20, this, "ptr", pQuery, "ptr", bstrMediaType, "ptr", bstrSortAttribute, "short", fSortAscending, "ptr*", ppPlaylist, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrAttribute 
     * @param {IWMPQuery} pQuery 
     * @param {BSTR} bstrMediaType 
     * @param {BSTR} bstrSortAttribute 
     * @param {VARIANT_BOOL} fSortAscending 
     * @param {Pointer<IWMPStringCollection>} ppStringCollection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmediacollection2-getstringcollectionbyquery
     */
    getStringCollectionByQuery(bstrAttribute, pQuery, bstrMediaType, bstrSortAttribute, fSortAscending, ppStringCollection) {
        bstrAttribute := bstrAttribute is String ? BSTR.Alloc(bstrAttribute).Value : bstrAttribute
        bstrMediaType := bstrMediaType is String ? BSTR.Alloc(bstrMediaType).Value : bstrMediaType
        bstrSortAttribute := bstrSortAttribute is String ? BSTR.Alloc(bstrSortAttribute).Value : bstrSortAttribute

        result := ComCall(21, this, "ptr", bstrAttribute, "ptr", pQuery, "ptr", bstrMediaType, "ptr", bstrSortAttribute, "short", fSortAscending, "ptr*", ppStringCollection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrAttribute 
     * @param {BSTR} bstrValue 
     * @param {BSTR} bstrMediaType 
     * @param {Pointer<IWMPPlaylist>} ppMediaItems 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmediacollection2-getbyattributeandmediatype
     */
    getByAttributeAndMediaType(bstrAttribute, bstrValue, bstrMediaType, ppMediaItems) {
        bstrAttribute := bstrAttribute is String ? BSTR.Alloc(bstrAttribute).Value : bstrAttribute
        bstrValue := bstrValue is String ? BSTR.Alloc(bstrValue).Value : bstrValue
        bstrMediaType := bstrMediaType is String ? BSTR.Alloc(bstrMediaType).Value : bstrMediaType

        result := ComCall(22, this, "ptr", bstrAttribute, "ptr", bstrValue, "ptr", bstrMediaType, "ptr*", ppMediaItems, "HRESULT")
        return result
    }
}
