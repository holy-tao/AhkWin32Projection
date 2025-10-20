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
     * 
     * @param {BSTR} bstrURL 
     * @param {Pointer<IWMPMedia>} ppItem 
     * @returns {HRESULT} 
     */
    add(bstrURL, ppItem) {
        bstrURL := bstrURL is String ? BSTR.Alloc(bstrURL).Value : bstrURL

        result := ComCall(7, this, "ptr", bstrURL, "ptr", ppItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMPPlaylist>} ppMediaItems 
     * @returns {HRESULT} 
     */
    getAll(ppMediaItems) {
        result := ComCall(8, this, "ptr", ppMediaItems, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {Pointer<IWMPPlaylist>} ppMediaItems 
     * @returns {HRESULT} 
     */
    getByName(bstrName, ppMediaItems) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(9, this, "ptr", bstrName, "ptr", ppMediaItems, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrGenre 
     * @param {Pointer<IWMPPlaylist>} ppMediaItems 
     * @returns {HRESULT} 
     */
    getByGenre(bstrGenre, ppMediaItems) {
        bstrGenre := bstrGenre is String ? BSTR.Alloc(bstrGenre).Value : bstrGenre

        result := ComCall(10, this, "ptr", bstrGenre, "ptr", ppMediaItems, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrAuthor 
     * @param {Pointer<IWMPPlaylist>} ppMediaItems 
     * @returns {HRESULT} 
     */
    getByAuthor(bstrAuthor, ppMediaItems) {
        bstrAuthor := bstrAuthor is String ? BSTR.Alloc(bstrAuthor).Value : bstrAuthor

        result := ComCall(11, this, "ptr", bstrAuthor, "ptr", ppMediaItems, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrAlbum 
     * @param {Pointer<IWMPPlaylist>} ppMediaItems 
     * @returns {HRESULT} 
     */
    getByAlbum(bstrAlbum, ppMediaItems) {
        bstrAlbum := bstrAlbum is String ? BSTR.Alloc(bstrAlbum).Value : bstrAlbum

        result := ComCall(12, this, "ptr", bstrAlbum, "ptr", ppMediaItems, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrAttribute 
     * @param {BSTR} bstrValue 
     * @param {Pointer<IWMPPlaylist>} ppMediaItems 
     * @returns {HRESULT} 
     */
    getByAttribute(bstrAttribute, bstrValue, ppMediaItems) {
        bstrAttribute := bstrAttribute is String ? BSTR.Alloc(bstrAttribute).Value : bstrAttribute
        bstrValue := bstrValue is String ? BSTR.Alloc(bstrValue).Value : bstrValue

        result := ComCall(13, this, "ptr", bstrAttribute, "ptr", bstrValue, "ptr", ppMediaItems, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMPMedia>} pItem 
     * @param {VARIANT_BOOL} varfDeleteFile 
     * @returns {HRESULT} 
     */
    remove(pItem, varfDeleteFile) {
        result := ComCall(14, this, "ptr", pItem, "short", varfDeleteFile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrAttribute 
     * @param {BSTR} bstrMediaType 
     * @param {Pointer<IWMPStringCollection>} ppStringCollection 
     * @returns {HRESULT} 
     */
    getAttributeStringCollection(bstrAttribute, bstrMediaType, ppStringCollection) {
        bstrAttribute := bstrAttribute is String ? BSTR.Alloc(bstrAttribute).Value : bstrAttribute
        bstrMediaType := bstrMediaType is String ? BSTR.Alloc(bstrMediaType).Value : bstrMediaType

        result := ComCall(15, this, "ptr", bstrAttribute, "ptr", bstrMediaType, "ptr", ppStringCollection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrItemName 
     * @param {Pointer<Int32>} plAtom 
     * @returns {HRESULT} 
     */
    getMediaAtom(bstrItemName, plAtom) {
        bstrItemName := bstrItemName is String ? BSTR.Alloc(bstrItemName).Value : bstrItemName

        result := ComCall(16, this, "ptr", bstrItemName, "int*", plAtom, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMPMedia>} pItem 
     * @param {VARIANT_BOOL} varfIsDeleted 
     * @returns {HRESULT} 
     */
    setDeleted(pItem, varfIsDeleted) {
        result := ComCall(17, this, "ptr", pItem, "short", varfIsDeleted, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMPMedia>} pItem 
     * @param {Pointer<VARIANT_BOOL>} pvarfIsDeleted 
     * @returns {HRESULT} 
     */
    isDeleted(pItem, pvarfIsDeleted) {
        result := ComCall(18, this, "ptr", pItem, "ptr", pvarfIsDeleted, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
