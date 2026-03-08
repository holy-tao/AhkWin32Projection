#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWMPPlaylist.ahk
#Include .\IWMPMedia.ahk
#Include .\IWMPCore2.ahk

/**
 * The IWMPCore3 interface provides methods that supplement the IWMPCore2 interface.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpcore3
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPCore3 extends IWMPCore2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPCore3
     * @type {Guid}
     */
    static IID => Guid("{7587c667-628f-499f-88e7-6a6f4e888464}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 29

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["newPlaylist", "newMedia"]

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

        result := ComCall(29, this, "ptr", bstrName, "ptr", bstrURL, "ptr*", &ppPlaylist := 0, "HRESULT")
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

        result := ComCall(30, this, "ptr", bstrURL, "ptr*", &ppMedia := 0, "HRESULT")
        return IWMPMedia(ppMedia)
    }
}
