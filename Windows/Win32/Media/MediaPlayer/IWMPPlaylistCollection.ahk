#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWMPPlaylist.ahk
#Include .\IWMPPlaylistArray.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IWMPPlaylistCollection interface provides methods for manipulating the IWMPPlaylist and IWMPPlaylistArray interfaces.
 * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nn-wmp-iwmpplaylistcollection
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
     * @remarks
     * This method creates an empty playlist in the library. To fill the playlist with media items, use <b>IWMPPlaylist::appendItem</b> or <b>IWMPPlaylist::insertItem</b>.
     * 
     * Multiple playlists having the same name are permitted in the library. To avoid creating a duplicate playlist name with this method, use the <b>getByName</b> method and <b>IWMPPlaylistArray::count</b> to determine whether a playlist with a particular name already exists.
     * 
     * Leading and trailing spaces are not permitted in playlist names, and are automatically removed from the value specified for the bstrName parameter.
     * 
     * Before calling this method, you must have full access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * @param {BSTR} bstrName String containing the name of the new playlist.
     * @returns {IWMPPlaylist} Pointer to a pointer to an <b>IWMPPlaylist</b> interface for the new playlist.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpplaylistcollection-newplaylist
     */
    newPlaylist(bstrName) {
        if(bstrName is String) {
            pin := BSTR.Alloc(bstrName)
            bstrName := pin.Value
        }

        result := ComCall(7, this, "ptr", bstrName, "ptr*", &ppItem := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWMPPlaylist(ppItem)
    }

    /**
     * The getAll method retrieves a pointer to an IWMPPlaylistArray interface representing all of the playlists in the library.
     * @remarks
     * Before calling this method, you must have read access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * @returns {IWMPPlaylistArray} Pointer to a pointer to an <b>IWMPPlaylistArray</b> interface for the retrieved array of playlists.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpplaylistcollection-getall
     */
    getAll() {
        result := ComCall(8, this, "ptr*", &ppPlaylistArray := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWMPPlaylistArray(ppPlaylistArray)
    }

    /**
     * The getByName method retrieves a pointer to an IWMPPlaylistArray interface on an object containing playlists with the specified name, if any exist.
     * @remarks
     * Use <b>IWMPPlaylistArray::count</b> to determine whether a playlist exists. If <b>count</b> is zero, the array is empty.
     * 
     * Before calling this method, you must have read access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * @param {BSTR} bstrName String containing the name.
     * @returns {IWMPPlaylistArray} Pointer to a pointer to an <b>IWMPPlaylistArray</b> interface for the retrieved array of playlists.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpplaylistcollection-getbyname
     */
    getByName(bstrName) {
        if(bstrName is String) {
            pin := BSTR.Alloc(bstrName)
            bstrName := pin.Value
        }

        result := ComCall(9, this, "ptr", bstrName, "ptr*", &ppPlaylistArray := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWMPPlaylistArray(ppPlaylistArray)
    }

    /**
     * The remove method removes a playlist from the library.
     * @remarks
     * Before calling this method, you must have full access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpplaylistcollection-remove
     */
    remove(pItem) {
        result := ComCall(10, this, "ptr", pItem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IWMPPlaylistCollection interface provides methods for manipulating the IWMPPlaylist and IWMPPlaylistArray interfaces.
     * @param {IWMPPlaylist} pItem 
     * @param {VARIANT_BOOL} varfIsDeleted 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nn-wmp-iwmpplaylistcollection
     */
    setDeleted(pItem, varfIsDeleted) {
        result := ComCall(11, this, "ptr", pItem, "short", varfIsDeleted, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The isDeleted method retrieves a value indicating whether the specified playlist is in the deleted items folder.
     * @remarks
     * <b>Windows Media Player 10 Mobile: </b>This method always retrieves a <b>VARIANT_BOOL</b> set to <b>FALSE</b>.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpplaylistcollection-isdeleted
     */
    isDeleted(pItem, pvarfIsDeleted) {
        pvarfIsDeletedMarshal := pvarfIsDeleted is VarRef ? "short*" : "ptr"

        result := ComCall(12, this, "ptr", pItem, pvarfIsDeletedMarshal, pvarfIsDeleted, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The importPlaylist method adds a static playlist to the library.
     * @remarks
     * Playlists that do not contain any media items cannot be added to the library by using this method. To create an empty playlist in the library, use the <b>newPlaylist</b> method. You can then fill the resulting playlist with media items by using <b>IWMPPlaylist::appendItem</b> or <b>IWMPPlaylist::insertItem</b>.
     * 
     * If you pass this method an auto playlist, the query is executed once and the result is added to the library as a static playlist. To add an auto playlist to the library and preserve its automatic behavior, use <b>IWMPMediaCollection::add</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/static-and-auto-playlists">Static and Auto Playlists</a>.
     * 
     * Before calling this method, you must have read access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * @param {IWMPPlaylist} pItem Pointer to an <b>IWMPPlaylist</b> interface for the playlist that this method will add.
     * @returns {IWMPPlaylist} Pointer to a pointer to an <b>IWMPPlaylist</b> interface for the added playlist.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpplaylistcollection-importplaylist
     */
    importPlaylist(pItem) {
        result := ComCall(13, this, "ptr", pItem, "ptr*", &ppImportedItem := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWMPPlaylist(ppImportedItem)
    }
}
