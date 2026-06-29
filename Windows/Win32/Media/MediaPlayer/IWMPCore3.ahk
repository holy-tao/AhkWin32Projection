#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWMPCore2.ahk" { IWMPCore2 }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IWMPMedia.ahk" { IWMPMedia }
#Import ".\IWMPPlaylist.ahk" { IWMPPlaylist }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IWMPCore3 interface provides methods that supplement the IWMPCore2 interface.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpcore3
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPCore3 extends IWMPCore2 {
    /**
     * The interface identifier for IWMPCore3
     * @type {Guid}
     */
    static IID := Guid("{7587c667-628f-499f-88e7-6a6f4e888464}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPCore3 interfaces
    */
    struct Vtbl extends IWMPCore2.Vtbl {
        newPlaylist : IntPtr
        newMedia    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPCore3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The newPlaylist method retrieves a pointer to an IWMPPlaylist interface for a new playlist.
     * @remarks
     * If the <i>bstrURL</i> parameter is a null or empty string, this method creates an empty <b>Playlist</b> object. If the <i>bstrname</i> parameter is an empty string, this method applies the current metafile name.
     * 
     * The new playlist created with this method is not added to the library. To add a new playlist to the library, use <b>IWMPPlaylistCollection::importPlaylist</b> or <b>IWMPPlaylistCollection::newPlaylist</b>. Any leading or trailing spaces in the playlist name are automatically removed when it is added to the library.
     * 
     * Because the library allows multiple playlists with the same name, you may want to check for the presence of a playlist with a given name before adding a new one.
     * @param {BSTR} bstrName <b>BSTR</b> containing the playlist name.
     * @param {BSTR} bstrURL <b>BSTR</b> containing the playlist URL.
     * @returns {IWMPPlaylist} Pointer to a pointer to an <b>IWMPPlaylist</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcore3-newplaylist
     */
    newPlaylist(bstrName, bstrURL) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrURL := bstrURL is String ? BSTR.Alloc(bstrURL).Value : bstrURL

        result := ComCall(29, this, BSTR, bstrName, BSTR, bstrURL, "ptr*", &ppPlaylist := 0, "HRESULT")
        return IWMPPlaylist(ppPlaylist)
    }

    /**
     * The newMedia method retrieves a pointer to an IWMPMedia interface for a new media item.
     * @remarks
     * The <i>bstrURL</i> parameter must not be an empty string or null.
     * @param {BSTR} bstrURL <b>BSTR</b> containing the URL.
     * @returns {IWMPMedia} Pointer to a pointer to an <b>IWMPMedia</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcore3-newmedia
     */
    newMedia(bstrURL) {
        bstrURL := bstrURL is String ? BSTR.Alloc(bstrURL).Value : bstrURL

        result := ComCall(30, this, BSTR, bstrURL, "ptr*", &ppMedia := 0, "HRESULT")
        return IWMPMedia(ppMedia)
    }

    Query(iid) {
        if (IWMPCore3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.newPlaylist := CallbackCreate(GetMethod(implObj, "newPlaylist"), flags, 4)
        this.vtbl.newMedia := CallbackCreate(GetMethod(implObj, "newMedia"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.newPlaylist)
        CallbackFree(this.vtbl.newMedia)
    }
}
