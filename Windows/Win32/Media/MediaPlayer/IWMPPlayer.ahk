#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWMPCore.ahk

/**
 * The IWMPPlayer interface provides methods for modifying the basic behavior of the Windows Media Player control user interface. These methods supplement the IWMPCore interface.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpplayer
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPPlayer extends IWMPCore{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPPlayer
     * @type {Guid}
     */
    static IID => Guid("{6bf52a4f-394a-11d3-b153-00c04f79faa6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 28

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_enabled", "put_enabled", "get_fullScreen", "put_fullScreen", "get_enableContextMenu", "put_enableContextMenu", "put_uiMode", "get_uiMode"]

    /**
     */
    enabled {
        get => this.get_enabled()
        set => this.put_enabled(value)
    }

    /**
     */
    fullScreen {
        get => this.get_fullScreen()
        set => this.put_fullScreen(value)
    }

    /**
     */
    enableContextMenu {
        get => this.get_enableContextMenu()
        set => this.put_enableContextMenu(value)
    }

    /**
     */
    uiMode {
        get => this.get_uiMode()
        set => this.put_uiMode(value)
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplayer-get_enabled
     */
    get_enabled(pbEnabled) {
        pbEnabledMarshal := pbEnabled is VarRef ? "short*" : "ptr"

        result := ComCall(28, this, pbEnabledMarshal, pbEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplayer-put_enabled
     */
    put_enabled(bEnabled) {
        result := ComCall(29, this, "short", bEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbFullScreen 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplayer-get_fullscreen
     */
    get_fullScreen(pbFullScreen) {
        pbFullScreenMarshal := pbFullScreen is VarRef ? "short*" : "ptr"

        result := ComCall(30, this, pbFullScreenMarshal, pbFullScreen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bFullScreen 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplayer-put_fullscreen
     */
    put_fullScreen(bFullScreen) {
        result := ComCall(31, this, "short", bFullScreen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbEnableContextMenu 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplayer-get_enablecontextmenu
     */
    get_enableContextMenu(pbEnableContextMenu) {
        pbEnableContextMenuMarshal := pbEnableContextMenu is VarRef ? "short*" : "ptr"

        result := ComCall(32, this, pbEnableContextMenuMarshal, pbEnableContextMenu, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnableContextMenu 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplayer-put_enablecontextmenu
     */
    put_enableContextMenu(bEnableContextMenu) {
        result := ComCall(33, this, "short", bEnableContextMenu, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplayer-put_uimode
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplayer-get_uimode
     */
    get_uiMode(pbstrMode) {
        result := ComCall(35, this, "ptr", pbstrMode, "HRESULT")
        return result
    }
}
