#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWMPCore.ahk

/**
 * The IWMPPlayer2 interface provides additional methods for modifying the basic behavior of the Windows Media Player control user interface.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpplayer2
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPPlayer2 extends IWMPCore{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPPlayer2
     * @type {Guid}
     */
    static IID => Guid("{0e6b01d1-d407-4c85-bf5f-1c01f6150280}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 28

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_enabled", "put_enabled", "get_fullScreen", "put_fullScreen", "get_enableContextMenu", "put_enableContextMenu", "put_uiMode", "get_uiMode", "get_stretchToFit", "put_stretchToFit", "get_windowlessVideo", "put_windowlessVideo"]

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbEnabled 
     * @returns {HRESULT} 
     */
    get_enabled(pbEnabled) {
        result := ComCall(28, this, "ptr", pbEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     */
    put_enabled(bEnabled) {
        result := ComCall(29, this, "short", bEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbFullScreen 
     * @returns {HRESULT} 
     */
    get_fullScreen(pbFullScreen) {
        result := ComCall(30, this, "ptr", pbFullScreen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bFullScreen 
     * @returns {HRESULT} 
     */
    put_fullScreen(bFullScreen) {
        result := ComCall(31, this, "short", bFullScreen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbEnableContextMenu 
     * @returns {HRESULT} 
     */
    get_enableContextMenu(pbEnableContextMenu) {
        result := ComCall(32, this, "ptr", pbEnableContextMenu, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnableContextMenu 
     * @returns {HRESULT} 
     */
    put_enableContextMenu(bEnableContextMenu) {
        result := ComCall(33, this, "short", bEnableContextMenu, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrMode 
     * @returns {HRESULT} 
     */
    put_uiMode(bstrMode) {
        bstrMode := bstrMode is String ? BSTR.Alloc(bstrMode).Value : bstrMode

        result := ComCall(34, this, "ptr", bstrMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrMode 
     * @returns {HRESULT} 
     */
    get_uiMode(pbstrMode) {
        result := ComCall(35, this, "ptr", pbstrMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplayer2-get_stretchtofit
     */
    get_stretchToFit(pbEnabled) {
        result := ComCall(36, this, "ptr", pbEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplayer2-put_stretchtofit
     */
    put_stretchToFit(bEnabled) {
        result := ComCall(37, this, "short", bEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplayer2-get_windowlessvideo
     */
    get_windowlessVideo(pbEnabled) {
        result := ComCall(38, this, "ptr", pbEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplayer2-put_windowlessvideo
     */
    put_windowlessVideo(bEnabled) {
        result := ComCall(39, this, "short", bEnabled, "HRESULT")
        return result
    }
}
