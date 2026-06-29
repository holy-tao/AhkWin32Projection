#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IWMPPlaylist.ahk" { IWMPPlaylist }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IWMPPlaylistArray interface provides methods for accessing a collection of IWMPPlaylist interface pointers by index number.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpplaylistarray
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPPlaylistArray extends IDispatch {
    /**
     * The interface identifier for IWMPPlaylistArray
     * @type {Guid}
     */
    static IID := Guid("{679409c0-99f7-11d3-9fb7-00105aa620bb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPPlaylistArray interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_count : IntPtr
        item      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPPlaylistArray.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     */
    count {
        get => this.get_count()
    }

    /**
     * The get_count method retrieves the number of playlists in the playlist array.
     * @remarks
     * Before calling this method, you must have read access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplaylistarray-get_count
     */
    get_count(plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, plCountMarshal, plCount, "HRESULT")
        return result
    }

    /**
     * The item method retrieves a pointer to an IWMPPlaylist interface representing the playlist at the specified index.
     * @remarks
     * Before calling this method, you must have read access to the library. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * @param {Integer} lIndex <b>long</b> containing the index that identifies the playlist that the method should retrieve.
     * @returns {IWMPPlaylist} Pointer to a pointer to an <b>IWMPPlaylist</b> interface for the retrieved playlist.
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplaylistarray-item
     */
    item(lIndex) {
        result := ComCall(8, this, "int", lIndex, "ptr*", &ppItem := 0, "HRESULT")
        return IWMPPlaylist(ppItem)
    }

    Query(iid) {
        if (IWMPPlaylistArray.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_count := CallbackCreate(GetMethod(implObj, "get_count"), flags, 2)
        this.vtbl.item := CallbackCreate(GetMethod(implObj, "item"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_count)
        CallbackFree(this.vtbl.item)
    }
}
