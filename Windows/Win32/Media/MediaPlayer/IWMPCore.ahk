#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IWMPCore interface is the root interface for the Windows Media Player control. It can be used to retrieve pointers to other interfaces supported by the control and to access some basic features.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpcore
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPCore extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPCore
     * @type {Guid}
     */
    static IID => Guid("{d84cca99-cce2-11d2-9ecc-0000f8085981}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["close", "get_URL", "put_URL", "get_openState", "get_playState", "get_controls", "get_settings", "get_currentMedia", "put_currentMedia", "get_mediaCollection", "get_playlistCollection", "get_versionInfo", "launchURL", "get_network", "get_currentPlaylist", "put_currentPlaylist", "get_cdromCollection", "get_closedCaption", "get_isOnline", "get_error", "get_status"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcore-close
     */
    close() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrURL 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcore-get_url
     */
    get_URL(pbstrURL) {
        result := ComCall(8, this, "ptr", pbstrURL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrURL 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcore-put_url
     */
    put_URL(bstrURL) {
        bstrURL := bstrURL is String ? BSTR.Alloc(bstrURL).Value : bstrURL

        result := ComCall(9, this, "ptr", bstrURL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pwmpos 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcore-get_openstate
     */
    get_openState(pwmpos) {
        result := ComCall(10, this, "int*", pwmpos, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pwmpps 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcore-get_playstate
     */
    get_playState(pwmpps) {
        result := ComCall(11, this, "int*", pwmpps, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IWMPControls>} ppControl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcore-get_controls
     */
    get_controls(ppControl) {
        result := ComCall(12, this, "ptr*", ppControl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IWMPSettings>} ppSettings 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcore-get_settings
     */
    get_settings(ppSettings) {
        result := ComCall(13, this, "ptr*", ppSettings, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IWMPMedia>} ppMedia 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcore-get_currentmedia
     */
    get_currentMedia(ppMedia) {
        result := ComCall(14, this, "ptr*", ppMedia, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWMPMedia} pMedia 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcore-put_currentmedia
     */
    put_currentMedia(pMedia) {
        result := ComCall(15, this, "ptr", pMedia, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IWMPMediaCollection>} ppMediaCollection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcore-get_mediacollection
     */
    get_mediaCollection(ppMediaCollection) {
        result := ComCall(16, this, "ptr*", ppMediaCollection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IWMPPlaylistCollection>} ppPlaylistCollection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcore-get_playlistcollection
     */
    get_playlistCollection(ppPlaylistCollection) {
        result := ComCall(17, this, "ptr*", ppPlaylistCollection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrVersionInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcore-get_versioninfo
     */
    get_versionInfo(pbstrVersionInfo) {
        result := ComCall(18, this, "ptr", pbstrVersionInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrURL 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcore-launchurl
     */
    launchURL(bstrURL) {
        bstrURL := bstrURL is String ? BSTR.Alloc(bstrURL).Value : bstrURL

        result := ComCall(19, this, "ptr", bstrURL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IWMPNetwork>} ppQNI 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcore-get_network
     */
    get_network(ppQNI) {
        result := ComCall(20, this, "ptr*", ppQNI, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IWMPPlaylist>} ppPL 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcore-get_currentplaylist
     */
    get_currentPlaylist(ppPL) {
        result := ComCall(21, this, "ptr*", ppPL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWMPPlaylist} pPL 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcore-put_currentplaylist
     */
    put_currentPlaylist(pPL) {
        result := ComCall(22, this, "ptr", pPL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IWMPCdromCollection>} ppCdromCollection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcore-get_cdromcollection
     */
    get_cdromCollection(ppCdromCollection) {
        result := ComCall(23, this, "ptr*", ppCdromCollection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IWMPClosedCaption>} ppClosedCaption 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcore-get_closedcaption
     */
    get_closedCaption(ppClosedCaption) {
        result := ComCall(24, this, "ptr*", ppClosedCaption, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfOnline 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcore-get_isonline
     */
    get_isOnline(pfOnline) {
        result := ComCall(25, this, "ptr", pfOnline, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IWMPError>} ppError 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcore-get_error
     */
    get_error(ppError) {
        result := ComCall(26, this, "ptr*", ppError, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcore-get_status
     */
    get_status(pbstrStatus) {
        result := ComCall(27, this, "ptr", pbstrStatus, "HRESULT")
        return result
    }
}
