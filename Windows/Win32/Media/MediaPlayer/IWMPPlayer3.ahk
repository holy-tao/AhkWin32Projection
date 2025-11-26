#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWMPCore2.ahk

/**
 * The IWMPPlayer3 interface provides methods for modifying the basic behavior of the control user interface. These methods supplement the IWMPCore2 interface.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpplayer3
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPPlayer3 extends IWMPCore2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPPlayer3
     * @type {Guid}
     */
    static IID => Guid("{54062b68-052a-4c25-a39f-8b63346511d4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 29

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_enabled", "put_enabled", "get_fullScreen", "put_fullScreen", "get_enableContextMenu", "put_enableContextMenu", "put_uiMode", "get_uiMode", "get_stretchToFit", "put_stretchToFit", "get_windowlessVideo", "put_windowlessVideo"]

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
     */
    stretchToFit {
        get => this.get_stretchToFit()
        set => this.put_stretchToFit(value)
    }

    /**
     */
    windowlessVideo {
        get => this.get_windowlessVideo()
        set => this.put_windowlessVideo(value)
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbEnabled 
     * @returns {HRESULT} 
     */
    get_enabled(pbEnabled) {
        pbEnabledMarshal := pbEnabled is VarRef ? "short*" : "ptr"

        result := ComCall(29, this, pbEnabledMarshal, pbEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     */
    put_enabled(bEnabled) {
        result := ComCall(30, this, "short", bEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbFullScreen 
     * @returns {HRESULT} 
     */
    get_fullScreen(pbFullScreen) {
        pbFullScreenMarshal := pbFullScreen is VarRef ? "short*" : "ptr"

        result := ComCall(31, this, pbFullScreenMarshal, pbFullScreen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bFullScreen 
     * @returns {HRESULT} 
     */
    put_fullScreen(bFullScreen) {
        result := ComCall(32, this, "short", bFullScreen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbEnableContextMenu 
     * @returns {HRESULT} 
     */
    get_enableContextMenu(pbEnableContextMenu) {
        pbEnableContextMenuMarshal := pbEnableContextMenu is VarRef ? "short*" : "ptr"

        result := ComCall(33, this, pbEnableContextMenuMarshal, pbEnableContextMenu, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnableContextMenu 
     * @returns {HRESULT} 
     */
    put_enableContextMenu(bEnableContextMenu) {
        result := ComCall(34, this, "short", bEnableContextMenu, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrMode 
     * @returns {HRESULT} 
     */
    put_uiMode(bstrMode) {
        bstrMode := bstrMode is String ? BSTR.Alloc(bstrMode).Value : bstrMode

        result := ComCall(35, this, "ptr", bstrMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrMode 
     * @returns {HRESULT} 
     */
    get_uiMode(pbstrMode) {
        result := ComCall(36, this, "ptr", pbstrMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbEnabled 
     * @returns {HRESULT} 
     */
    get_stretchToFit(pbEnabled) {
        pbEnabledMarshal := pbEnabled is VarRef ? "short*" : "ptr"

        result := ComCall(37, this, pbEnabledMarshal, pbEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     */
    put_stretchToFit(bEnabled) {
        result := ComCall(38, this, "short", bEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbEnabled 
     * @returns {HRESULT} 
     */
    get_windowlessVideo(pbEnabled) {
        pbEnabledMarshal := pbEnabled is VarRef ? "short*" : "ptr"

        result := ComCall(39, this, pbEnabledMarshal, pbEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     */
    put_windowlessVideo(bEnabled) {
        result := ComCall(40, this, "short", bEnabled, "HRESULT")
        return result
    }
}
