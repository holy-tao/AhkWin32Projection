#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IWMPMediaCollection interface provides methods that can be used to organize a large collection of media items.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpmediacollection
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPMediaCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPMediaCollection
     * @type {Guid}
     */
    static IID => Guid("{8363bc22-b4b4-4b19-989d-1cd765749dd1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add", "getAll", "getByName", "getByGenre", "getByAuthor", "getByAlbum", "getByAttribute", "remove", "getAttributeStringCollection", "getMediaAtom", "setDeleted", "isDeleted"]

    /**
     * 
     * @param {BSTR} bstrURL 
     * @param {Pointer<IWMPMedia>} ppItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmediacollection-add
     */
    add(bstrURL, ppItem) {
        bstrURL := bstrURL is String ? BSTR.Alloc(bstrURL).Value : bstrURL

        result := ComCall(7, this, "ptr", bstrURL, "ptr*", ppItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IWMPPlaylist>} ppMediaItems 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmediacollection-getall
     */
    getAll(ppMediaItems) {
        result := ComCall(8, this, "ptr*", ppMediaItems, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {Pointer<IWMPPlaylist>} ppMediaItems 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmediacollection-getbyname
     */
    getByName(bstrName, ppMediaItems) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(9, this, "ptr", bstrName, "ptr*", ppMediaItems, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrGenre 
     * @param {Pointer<IWMPPlaylist>} ppMediaItems 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmediacollection-getbygenre
     */
    getByGenre(bstrGenre, ppMediaItems) {
        bstrGenre := bstrGenre is String ? BSTR.Alloc(bstrGenre).Value : bstrGenre

        result := ComCall(10, this, "ptr", bstrGenre, "ptr*", ppMediaItems, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrAuthor 
     * @param {Pointer<IWMPPlaylist>} ppMediaItems 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmediacollection-getbyauthor
     */
    getByAuthor(bstrAuthor, ppMediaItems) {
        bstrAuthor := bstrAuthor is String ? BSTR.Alloc(bstrAuthor).Value : bstrAuthor

        result := ComCall(11, this, "ptr", bstrAuthor, "ptr*", ppMediaItems, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrAlbum 
     * @param {Pointer<IWMPPlaylist>} ppMediaItems 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmediacollection-getbyalbum
     */
    getByAlbum(bstrAlbum, ppMediaItems) {
        bstrAlbum := bstrAlbum is String ? BSTR.Alloc(bstrAlbum).Value : bstrAlbum

        result := ComCall(12, this, "ptr", bstrAlbum, "ptr*", ppMediaItems, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrAttribute 
     * @param {BSTR} bstrValue 
     * @param {Pointer<IWMPPlaylist>} ppMediaItems 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmediacollection-getbyattribute
     */
    getByAttribute(bstrAttribute, bstrValue, ppMediaItems) {
        bstrAttribute := bstrAttribute is String ? BSTR.Alloc(bstrAttribute).Value : bstrAttribute
        bstrValue := bstrValue is String ? BSTR.Alloc(bstrValue).Value : bstrValue

        result := ComCall(13, this, "ptr", bstrAttribute, "ptr", bstrValue, "ptr*", ppMediaItems, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWMPMedia} pItem 
     * @param {VARIANT_BOOL} varfDeleteFile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmediacollection-remove
     */
    remove(pItem, varfDeleteFile) {
        result := ComCall(14, this, "ptr", pItem, "short", varfDeleteFile, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrAttribute 
     * @param {BSTR} bstrMediaType 
     * @param {Pointer<IWMPStringCollection>} ppStringCollection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmediacollection-getattributestringcollection
     */
    getAttributeStringCollection(bstrAttribute, bstrMediaType, ppStringCollection) {
        bstrAttribute := bstrAttribute is String ? BSTR.Alloc(bstrAttribute).Value : bstrAttribute
        bstrMediaType := bstrMediaType is String ? BSTR.Alloc(bstrMediaType).Value : bstrMediaType

        result := ComCall(15, this, "ptr", bstrAttribute, "ptr", bstrMediaType, "ptr*", ppStringCollection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrItemName 
     * @param {Pointer<Integer>} plAtom 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmediacollection-getmediaatom
     */
    getMediaAtom(bstrItemName, plAtom) {
        bstrItemName := bstrItemName is String ? BSTR.Alloc(bstrItemName).Value : bstrItemName

        result := ComCall(16, this, "ptr", bstrItemName, "int*", plAtom, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWMPMedia} pItem 
     * @param {VARIANT_BOOL} varfIsDeleted 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmediacollection-setdeleted
     */
    setDeleted(pItem, varfIsDeleted) {
        result := ComCall(17, this, "ptr", pItem, "short", varfIsDeleted, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWMPMedia} pItem 
     * @param {Pointer<VARIANT_BOOL>} pvarfIsDeleted 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpmediacollection
     */
    isDeleted(pItem, pvarfIsDeleted) {
        result := ComCall(18, this, "ptr", pItem, "ptr", pvarfIsDeleted, "HRESULT")
        return result
    }
}
