#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMPPlaylist.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IWMPPlaylistArray interface provides methods for accessing a collection of IWMPPlaylist interface pointers by index number.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpplaylistarray
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPPlaylistArray extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPPlaylistArray
     * @type {Guid}
     */
    static IID => Guid("{679409c0-99f7-11d3-9fb7-00105aa620bb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_count", "item"]

    /**
     */
    count {
        get => this.get_count()
    }

    /**
     * The get_count method retrieves the number of playlists in the playlist array.
     * @param {Pointer<Integer>} plCount Pointer to a <b>long</b> containing the count.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpplaylistarray-get_count
     */
    get_count(plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, plCountMarshal, plCount, "HRESULT")
        return result
    }

    /**
     * The item method retrieves a pointer to an IWMPPlaylist interface representing the playlist at the specified index.
     * @param {Integer} lIndex <b>long</b> containing the index that identifies the playlist that the method should retrieve.
     * @returns {IWMPPlaylist} Pointer to a pointer to an <b>IWMPPlaylist</b> interface for the retrieved playlist.
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpplaylistarray-item
     */
    item(lIndex) {
        result := ComCall(8, this, "int", lIndex, "ptr*", &ppItem := 0, "HRESULT")
        return IWMPPlaylist(ppItem)
    }
}
