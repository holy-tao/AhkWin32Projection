#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWMPMedia.ahk
#Include .\IWMPPlaylist.ahk
#Include .\IWMPStringCollection.ahk
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
     * @returns {IWMPMedia} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmediacollection-add
     */
    add(bstrURL) {
        bstrURL := bstrURL is String ? BSTR.Alloc(bstrURL).Value : bstrURL

        result := ComCall(7, this, "ptr", bstrURL, "ptr*", &ppItem := 0, "HRESULT")
        return IWMPMedia(ppItem)
    }

    /**
     * 
     * @returns {IWMPPlaylist} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmediacollection-getall
     */
    getAll() {
        result := ComCall(8, this, "ptr*", &ppMediaItems := 0, "HRESULT")
        return IWMPPlaylist(ppMediaItems)
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {IWMPPlaylist} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmediacollection-getbyname
     */
    getByName(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(9, this, "ptr", bstrName, "ptr*", &ppMediaItems := 0, "HRESULT")
        return IWMPPlaylist(ppMediaItems)
    }

    /**
     * 
     * @param {BSTR} bstrGenre 
     * @returns {IWMPPlaylist} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmediacollection-getbygenre
     */
    getByGenre(bstrGenre) {
        bstrGenre := bstrGenre is String ? BSTR.Alloc(bstrGenre).Value : bstrGenre

        result := ComCall(10, this, "ptr", bstrGenre, "ptr*", &ppMediaItems := 0, "HRESULT")
        return IWMPPlaylist(ppMediaItems)
    }

    /**
     * 
     * @param {BSTR} bstrAuthor 
     * @returns {IWMPPlaylist} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmediacollection-getbyauthor
     */
    getByAuthor(bstrAuthor) {
        bstrAuthor := bstrAuthor is String ? BSTR.Alloc(bstrAuthor).Value : bstrAuthor

        result := ComCall(11, this, "ptr", bstrAuthor, "ptr*", &ppMediaItems := 0, "HRESULT")
        return IWMPPlaylist(ppMediaItems)
    }

    /**
     * 
     * @param {BSTR} bstrAlbum 
     * @returns {IWMPPlaylist} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmediacollection-getbyalbum
     */
    getByAlbum(bstrAlbum) {
        bstrAlbum := bstrAlbum is String ? BSTR.Alloc(bstrAlbum).Value : bstrAlbum

        result := ComCall(12, this, "ptr", bstrAlbum, "ptr*", &ppMediaItems := 0, "HRESULT")
        return IWMPPlaylist(ppMediaItems)
    }

    /**
     * 
     * @param {BSTR} bstrAttribute 
     * @param {BSTR} bstrValue 
     * @returns {IWMPPlaylist} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmediacollection-getbyattribute
     */
    getByAttribute(bstrAttribute, bstrValue) {
        bstrAttribute := bstrAttribute is String ? BSTR.Alloc(bstrAttribute).Value : bstrAttribute
        bstrValue := bstrValue is String ? BSTR.Alloc(bstrValue).Value : bstrValue

        result := ComCall(13, this, "ptr", bstrAttribute, "ptr", bstrValue, "ptr*", &ppMediaItems := 0, "HRESULT")
        return IWMPPlaylist(ppMediaItems)
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
     * @returns {IWMPStringCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmediacollection-getattributestringcollection
     */
    getAttributeStringCollection(bstrAttribute, bstrMediaType) {
        bstrAttribute := bstrAttribute is String ? BSTR.Alloc(bstrAttribute).Value : bstrAttribute
        bstrMediaType := bstrMediaType is String ? BSTR.Alloc(bstrMediaType).Value : bstrMediaType

        result := ComCall(15, this, "ptr", bstrAttribute, "ptr", bstrMediaType, "ptr*", &ppStringCollection := 0, "HRESULT")
        return IWMPStringCollection(ppStringCollection)
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

        plAtomMarshal := plAtom is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, "ptr", bstrItemName, plAtomMarshal, plAtom, "HRESULT")
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
        pvarfIsDeletedMarshal := pvarfIsDeleted is VarRef ? "short*" : "ptr"

        result := ComCall(18, this, "ptr", pItem, pvarfIsDeletedMarshal, pvarfIsDeleted, "HRESULT")
        return result
    }
}
