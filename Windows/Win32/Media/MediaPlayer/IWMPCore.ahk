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
     * 
     * @returns {HRESULT} 
     */
    close() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrURL 
     * @returns {HRESULT} 
     */
    get_URL(pbstrURL) {
        result := ComCall(8, this, "ptr", pbstrURL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrURL 
     * @returns {HRESULT} 
     */
    put_URL(bstrURL) {
        bstrURL := bstrURL is String ? BSTR.Alloc(bstrURL).Value : bstrURL

        result := ComCall(9, this, "ptr", bstrURL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pwmpos 
     * @returns {HRESULT} 
     */
    get_openState(pwmpos) {
        result := ComCall(10, this, "int*", pwmpos, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pwmpps 
     * @returns {HRESULT} 
     */
    get_playState(pwmpps) {
        result := ComCall(11, this, "int*", pwmpps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMPControls>} ppControl 
     * @returns {HRESULT} 
     */
    get_controls(ppControl) {
        result := ComCall(12, this, "ptr", ppControl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMPSettings>} ppSettings 
     * @returns {HRESULT} 
     */
    get_settings(ppSettings) {
        result := ComCall(13, this, "ptr", ppSettings, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMPMedia>} ppMedia 
     * @returns {HRESULT} 
     */
    get_currentMedia(ppMedia) {
        result := ComCall(14, this, "ptr", ppMedia, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMPMedia>} pMedia 
     * @returns {HRESULT} 
     */
    put_currentMedia(pMedia) {
        result := ComCall(15, this, "ptr", pMedia, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMPMediaCollection>} ppMediaCollection 
     * @returns {HRESULT} 
     */
    get_mediaCollection(ppMediaCollection) {
        result := ComCall(16, this, "ptr", ppMediaCollection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMPPlaylistCollection>} ppPlaylistCollection 
     * @returns {HRESULT} 
     */
    get_playlistCollection(ppPlaylistCollection) {
        result := ComCall(17, this, "ptr", ppPlaylistCollection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrVersionInfo 
     * @returns {HRESULT} 
     */
    get_versionInfo(pbstrVersionInfo) {
        result := ComCall(18, this, "ptr", pbstrVersionInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrURL 
     * @returns {HRESULT} 
     */
    launchURL(bstrURL) {
        bstrURL := bstrURL is String ? BSTR.Alloc(bstrURL).Value : bstrURL

        result := ComCall(19, this, "ptr", bstrURL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMPNetwork>} ppQNI 
     * @returns {HRESULT} 
     */
    get_network(ppQNI) {
        result := ComCall(20, this, "ptr", ppQNI, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMPPlaylist>} ppPL 
     * @returns {HRESULT} 
     */
    get_currentPlaylist(ppPL) {
        result := ComCall(21, this, "ptr", ppPL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMPPlaylist>} pPL 
     * @returns {HRESULT} 
     */
    put_currentPlaylist(pPL) {
        result := ComCall(22, this, "ptr", pPL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMPCdromCollection>} ppCdromCollection 
     * @returns {HRESULT} 
     */
    get_cdromCollection(ppCdromCollection) {
        result := ComCall(23, this, "ptr", ppCdromCollection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMPClosedCaption>} ppClosedCaption 
     * @returns {HRESULT} 
     */
    get_closedCaption(ppClosedCaption) {
        result := ComCall(24, this, "ptr", ppClosedCaption, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfOnline 
     * @returns {HRESULT} 
     */
    get_isOnline(pfOnline) {
        result := ComCall(25, this, "ptr", pfOnline, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMPError>} ppError 
     * @returns {HRESULT} 
     */
    get_error(ppError) {
        result := ComCall(26, this, "ptr", ppError, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrStatus 
     * @returns {HRESULT} 
     */
    get_status(pbstrStatus) {
        result := ComCall(27, this, "ptr", pbstrStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
