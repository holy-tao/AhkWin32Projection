#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IWMPPlaylist.ahk" { IWMPPlaylist }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IWMPCdrom interface provides a way to access a CD or DVD in its drive.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpcdrom
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPCdrom extends IDispatch {
    /**
     * The interface identifier for IWMPCdrom
     * @type {Guid}
     */
    static IID := Guid("{cfab6e98-8730-11d3-b388-00c04f68574b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPCdrom interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_driveSpecifier : IntPtr
        get_playlist       : IntPtr
        eject              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPCdrom.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     */
    driveSpecifier {
        get => this.get_driveSpecifier()
    }

    /**
     * @type {IWMPPlaylist} 
     */
    playlist {
        get => this.get_playlist()
    }

    /**
     * The get_driveSpecifier method retrieves the CD or DVD drive letter.
     * @remarks
     * Typically, DVD drives can play CD media, but CD drives cannot play DVD media.
     * 
     * This method retrieves a drive letter for a zero-based drive index within the range retrieved using the <b>IWMPCdromCollection::get_count</b> method. The value retrieved takes the form <i>X</i>:, where <i>X</i> represents the drive letter.
     * 
     * To retrieve the value of this property, read access to the library is required. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @param {Pointer<BSTR>} pbstrDrive Pointer to a <b>BSTR</b> containing the drive.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcdrom-get_drivespecifier
     */
    get_driveSpecifier(pbstrDrive) {
        result := ComCall(7, this, BSTR.Ptr, pbstrDrive, "HRESULT")
        return result
    }

    /**
     * The get_playlist method retrieves a pointer to an IWMPPlaylist interface representing the tracks on the CD currently in the CD drive or the root-level title entries for a DVD.
     * @remarks
     * Typically, DVD-based content organized into titles. Each title contains one or more chapters. Each DVD is authored differently, so how titles and chapters are used is up to the content author.
     * 
     * For a DVD, this method retrieves a playlist that contains as the first item a pointer to an <b>IWMPMedia</b> interface named "DVD". This interface represents the DVD media. Playing the item results in the DVD playing from the beginning if it is the first play after inserting a new DVD, or resuming playback if the DVD is the same as the last DVD viewed. Setting this item as the current item during playback results in the DVD playing from the beginning.
     * 
     * Additional items (<b>IWMPMedia</b> objects) in the playlist are DVD titles that are represented by nested playlists. When you specify a value for the <b>IWMPControls::put_currentItem</b> method to equal one of these nested playlist items, Windows Media Player automatically sets the nested playlist as the current playlist after chapter playback begins. You can then use the <b>IWMPPlaylist</b> interface methods and associated events to work with DVD chapters, which are also playlist items.
     * 
     * To retrieve the value of this property, read access to the library is required. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @returns {IWMPPlaylist} Pointer to a pointer to an <b>IWMPPlaylist</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcdrom-get_playlist
     */
    get_playlist() {
        result := ComCall(8, this, "ptr*", &ppPlaylist := 0, "HRESULT")
        return IWMPPlaylist(ppPlaylist)
    }

    /**
     * The eject method ejects the CD or DVD from the drive.
     * @remarks
     * If the drive door is open, this method closes the door.
     * 
     * To use this method, read access to the library is required. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/library-access">Library Access</a>.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcdrom-eject
     */
    eject() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMPCdrom.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_driveSpecifier := CallbackCreate(GetMethod(implObj, "get_driveSpecifier"), flags, 2)
        this.vtbl.get_playlist := CallbackCreate(GetMethod(implObj, "get_playlist"), flags, 2)
        this.vtbl.eject := CallbackCreate(GetMethod(implObj, "eject"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_driveSpecifier)
        CallbackFree(this.vtbl.get_playlist)
        CallbackFree(this.vtbl.eject)
    }
}
