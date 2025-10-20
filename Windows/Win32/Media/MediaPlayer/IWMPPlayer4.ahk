#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWMPCore3.ahk

/**
 * The IWMPPlayer4 interface provides methods for modifying the basic behavior of the Windows Media Player control user interface.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpplayer4
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPPlayer4 extends IWMPCore3{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPPlayer4
     * @type {Guid}
     */
    static IID => Guid("{6c497d62-8919-413c-82db-e935fb3ec584}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 31

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_enabled", "put_enabled", "get_fullScreen", "put_fullScreen", "get_enableContextMenu", "put_enableContextMenu", "put_uiMode", "get_uiMode", "get_stretchToFit", "put_stretchToFit", "get_windowlessVideo", "put_windowlessVideo", "get_isRemote", "get_playerApplication", "openPlayer"]

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbEnabled 
     * @returns {HRESULT} 
     */
    get_enabled(pbEnabled) {
        result := ComCall(31, this, "ptr", pbEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     */
    put_enabled(bEnabled) {
        result := ComCall(32, this, "short", bEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbFullScreen 
     * @returns {HRESULT} 
     */
    get_fullScreen(pbFullScreen) {
        result := ComCall(33, this, "ptr", pbFullScreen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bFullScreen 
     * @returns {HRESULT} 
     */
    put_fullScreen(bFullScreen) {
        result := ComCall(34, this, "short", bFullScreen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbEnableContextMenu 
     * @returns {HRESULT} 
     */
    get_enableContextMenu(pbEnableContextMenu) {
        result := ComCall(35, this, "ptr", pbEnableContextMenu, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnableContextMenu 
     * @returns {HRESULT} 
     */
    put_enableContextMenu(bEnableContextMenu) {
        result := ComCall(36, this, "short", bEnableContextMenu, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrMode 
     * @returns {HRESULT} 
     */
    put_uiMode(bstrMode) {
        bstrMode := bstrMode is String ? BSTR.Alloc(bstrMode).Value : bstrMode

        result := ComCall(37, this, "ptr", bstrMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrMode 
     * @returns {HRESULT} 
     */
    get_uiMode(pbstrMode) {
        result := ComCall(38, this, "ptr", pbstrMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbEnabled 
     * @returns {HRESULT} 
     */
    get_stretchToFit(pbEnabled) {
        result := ComCall(39, this, "ptr", pbEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     */
    put_stretchToFit(bEnabled) {
        result := ComCall(40, this, "short", bEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbEnabled 
     * @returns {HRESULT} 
     */
    get_windowlessVideo(pbEnabled) {
        result := ComCall(41, this, "ptr", pbEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     */
    put_windowlessVideo(bEnabled) {
        result := ComCall(42, this, "short", bEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pvarfIsRemote 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplayer4-get_isremote
     */
    get_isRemote(pvarfIsRemote) {
        result := ComCall(43, this, "ptr", pvarfIsRemote, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IWMPPlayerApplication>} ppIWMPPlayerApplication 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplayer4-get_playerapplication
     */
    get_playerApplication(ppIWMPPlayerApplication) {
        result := ComCall(44, this, "ptr*", ppIWMPPlayerApplication, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrURL 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplayer4-openplayer
     */
    openPlayer(bstrURL) {
        bstrURL := bstrURL is String ? BSTR.Alloc(bstrURL).Value : bstrURL

        result := ComCall(45, this, "ptr", bstrURL, "HRESULT")
        return result
    }
}
