#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWMPPlaylist.ahk
#Include .\IWMPPlaylistArray.ahk
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
     * The newPlaylist method creates a new, empty playlist in the library.
     * @param {BSTR} bstrName String containing the name of the new playlist.
     * @returns {IWMPPlaylist} Pointer to a pointer to an <b>IWMPPlaylist</b> interface for the new playlist.
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpplaylistcollection-newplaylist
     */
    newPlaylist(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(7, this, "ptr", bstrName, "ptr*", &ppItem := 0, "HRESULT")
        return IWMPPlaylist(ppItem)
    }

    /**
     * The getAll method retrieves a pointer to an IWMPPlaylistArray interface representing all of the playlists in the library.
     * @returns {IWMPPlaylistArray} Pointer to a pointer to an <b>IWMPPlaylistArray</b> interface for the retrieved array of playlists.
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpplaylistcollection-getall
     */
    getAll() {
        result := ComCall(8, this, "ptr*", &ppPlaylistArray := 0, "HRESULT")
        return IWMPPlaylistArray(ppPlaylistArray)
    }

    /**
     * The getByName method retrieves a pointer to an IWMPPlaylistArray interface on an object containing playlists with the specified name, if any exist.
     * @param {BSTR} bstrName String containing the name.
     * @returns {IWMPPlaylistArray} Pointer to a pointer to an <b>IWMPPlaylistArray</b> interface for the retrieved array of playlists.
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpplaylistcollection-getbyname
     */
    getByName(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(9, this, "ptr", bstrName, "ptr*", &ppPlaylistArray := 0, "HRESULT")
        return IWMPPlaylistArray(ppPlaylistArray)
    }

    /**
     * The remove method removes a playlist from the library.
     * @param {IWMPPlaylist} pItem Pointer to an <b>IWMPPlaylist</b> interface for the playlist that this method will remove.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpplaylistcollection-remove
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
     * The isDeleted method retrieves a value indicating whether the specified playlist is in the deleted items folder.
     * @param {IWMPPlaylist} pItem Pointer to an <b>IWMPPlaylist</b> interface for the queried playlist.
     * @param {Pointer<VARIANT_BOOL>} pvarfIsDeleted Pointer to a <b>VARIANT_BOOL</b> that specifies whether the given playlist was deleted.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpplaylistcollection-isdeleted
     */
    isDeleted(pItem, pvarfIsDeleted) {
        pvarfIsDeletedMarshal := pvarfIsDeleted is VarRef ? "short*" : "ptr"

        result := ComCall(12, this, "ptr", pItem, pvarfIsDeletedMarshal, pvarfIsDeleted, "HRESULT")
        return result
    }

    /**
     * The importPlaylist method adds a static playlist to the library.
     * @param {IWMPPlaylist} pItem Pointer to an <b>IWMPPlaylist</b> interface for the playlist that this method will add.
     * @returns {IWMPPlaylist} Pointer to a pointer to an <b>IWMPPlaylist</b> interface for the added playlist.
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpplaylistcollection-importplaylist
     */
    importPlaylist(pItem) {
        result := ComCall(13, this, "ptr", pItem, "ptr*", &ppImportedItem := 0, "HRESULT")
        return IWMPPlaylist(ppImportedItem)
    }
}
