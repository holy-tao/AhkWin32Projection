#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IWMPPlaylistCollection interface provides methods for manipulating the IWMPPlaylist and IWMPPlaylistArray interfaces.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpplaylistcollection
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPPlaylistCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPPlaylistCollection
     * @type {Guid}
     */
    static IID => Guid("{10a13217-23a7-439b-b1c0-d847c79b7774}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["newPlaylist", "getAll", "getByName", "remove", "setDeleted", "isDeleted", "importPlaylist"]

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {Pointer<IWMPPlaylist>} ppItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplaylistcollection-newplaylist
     */
    newPlaylist(bstrName, ppItem) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(7, this, "ptr", bstrName, "ptr*", ppItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IWMPPlaylistArray>} ppPlaylistArray 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplaylistcollection-getall
     */
    getAll(ppPlaylistArray) {
        result := ComCall(8, this, "ptr*", ppPlaylistArray, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {Pointer<IWMPPlaylistArray>} ppPlaylistArray 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplaylistcollection-getbyname
     */
    getByName(bstrName, ppPlaylistArray) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(9, this, "ptr", bstrName, "ptr*", ppPlaylistArray, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWMPPlaylist} pItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplaylistcollection-remove
     */
    remove(pItem) {
        result := ComCall(10, this, "ptr", pItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWMPPlaylist} pItem 
     * @param {VARIANT_BOOL} varfIsDeleted 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpplaylistcollection
     */
    setDeleted(pItem, varfIsDeleted) {
        result := ComCall(11, this, "ptr", pItem, "short", varfIsDeleted, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWMPPlaylist} pItem 
     * @param {Pointer<VARIANT_BOOL>} pvarfIsDeleted 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplaylistcollection-isdeleted
     */
    isDeleted(pItem, pvarfIsDeleted) {
        result := ComCall(12, this, "ptr", pItem, "ptr", pvarfIsDeleted, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWMPPlaylist} pItem 
     * @param {Pointer<IWMPPlaylist>} ppImportedItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplaylistcollection-importplaylist
     */
    importPlaylist(pItem, ppImportedItem) {
        result := ComCall(13, this, "ptr", pItem, "ptr*", ppImportedItem, "HRESULT")
        return result
    }
}
