#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IWMPPlayerApplication.ahk" { IWMPPlayerApplication }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWMPCore3.ahk" { IWMPCore3 }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * The IWMPPlayer4 interface provides methods for modifying the basic behavior of the Windows Media Player control user interface.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpplayer4
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPPlayer4 extends IWMPCore3 {
    /**
     * The interface identifier for IWMPPlayer4
     * @type {Guid}
     */
    static IID := Guid("{6c497d62-8919-413c-82db-e935fb3ec584}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPPlayer4 interfaces
    */
    struct Vtbl extends IWMPCore3.Vtbl {
        get_enabled           : IntPtr
        put_enabled           : IntPtr
        get_fullScreen        : IntPtr
        put_fullScreen        : IntPtr
        get_enableContextMenu : IntPtr
        put_enableContextMenu : IntPtr
        put_uiMode            : IntPtr
        get_uiMode            : IntPtr
        get_stretchToFit      : IntPtr
        put_stretchToFit      : IntPtr
        get_windowlessVideo   : IntPtr
        put_windowlessVideo   : IntPtr
        get_isRemote          : IntPtr
        get_playerApplication : IntPtr
        openPlayer            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPPlayer4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    enabled {
        get => this.get_enabled()
        set => this.put_enabled(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    fullScreen {
        get => this.get_fullScreen()
        set => this.put_fullScreen(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    enableContextMenu {
        get => this.get_enableContextMenu()
        set => this.put_enableContextMenu(value)
    }

    /**
     * @type {BSTR} 
     */
    uiMode {
        get => this.get_uiMode()
        set => this.put_uiMode(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    stretchToFit {
        get => this.get_stretchToFit()
        set => this.put_stretchToFit(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    windowlessVideo {
        get => this.get_windowlessVideo()
        set => this.put_windowlessVideo(value)
    }

    /**
     */
    isRemote {
        get => this.get_isRemote()
    }

    /**
     * @type {IWMPPlayerApplication} 
     */
    playerApplication {
        get => this.get_playerApplication()
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbEnabled 
     * @returns {HRESULT} 
     */
    get_enabled(pbEnabled) {
        pbEnabledMarshal := pbEnabled is VarRef ? "short*" : "ptr"

        result := ComCall(31, this, pbEnabledMarshal, pbEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     */
    put_enabled(bEnabled) {
        result := ComCall(32, this, VARIANT_BOOL, bEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbFullScreen 
     * @returns {HRESULT} 
     */
    get_fullScreen(pbFullScreen) {
        pbFullScreenMarshal := pbFullScreen is VarRef ? "short*" : "ptr"

        result := ComCall(33, this, pbFullScreenMarshal, pbFullScreen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bFullScreen 
     * @returns {HRESULT} 
     */
    put_fullScreen(bFullScreen) {
        result := ComCall(34, this, VARIANT_BOOL, bFullScreen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbEnableContextMenu 
     * @returns {HRESULT} 
     */
    get_enableContextMenu(pbEnableContextMenu) {
        pbEnableContextMenuMarshal := pbEnableContextMenu is VarRef ? "short*" : "ptr"

        result := ComCall(35, this, pbEnableContextMenuMarshal, pbEnableContextMenu, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnableContextMenu 
     * @returns {HRESULT} 
     */
    put_enableContextMenu(bEnableContextMenu) {
        result := ComCall(36, this, VARIANT_BOOL, bEnableContextMenu, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrMode 
     * @returns {HRESULT} 
     */
    put_uiMode(bstrMode) {
        bstrMode := bstrMode is String ? BSTR.Alloc(bstrMode).Value : bstrMode

        result := ComCall(37, this, BSTR, bstrMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrMode 
     * @returns {HRESULT} 
     */
    get_uiMode(pbstrMode) {
        result := ComCall(38, this, BSTR.Ptr, pbstrMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbEnabled 
     * @returns {HRESULT} 
     */
    get_stretchToFit(pbEnabled) {
        pbEnabledMarshal := pbEnabled is VarRef ? "short*" : "ptr"

        result := ComCall(39, this, pbEnabledMarshal, pbEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     */
    put_stretchToFit(bEnabled) {
        result := ComCall(40, this, VARIANT_BOOL, bEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbEnabled 
     * @returns {HRESULT} 
     */
    get_windowlessVideo(pbEnabled) {
        pbEnabledMarshal := pbEnabled is VarRef ? "short*" : "ptr"

        result := ComCall(41, this, pbEnabledMarshal, pbEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     */
    put_windowlessVideo(bEnabled) {
        result := ComCall(42, this, VARIANT_BOOL, bEnabled, "HRESULT")
        return result
    }

    /**
     * The get_isRemote method retrieves a value indicating whether the Windows Media Player control is running in remote mode.
     * @remarks
     * <b>Windows Media Player 10 Mobile: </b>This method always retrieves a <b>VARIANT_BOOL</b> set to <b>FALSE</b>.
     * @param {Pointer<VARIANT_BOOL>} pvarfIsRemote Pointer to a <b>VARIANT_BOOL</b> indicating whether the Windows Media Player control is running in remote mode. If the value is <b>TRUE</b>, then the control is running in remote mode. A value of <b>FALSE</b> means the control is running in local mode.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplayer4-get_isremote
     */
    get_isRemote(pvarfIsRemote) {
        pvarfIsRemoteMarshal := pvarfIsRemote is VarRef ? "short*" : "ptr"

        result := ComCall(43, this, pvarfIsRemoteMarshal, pvarfIsRemote, "HRESULT")
        return result
    }

    /**
     * The get_playerApplication method retrieves a pointer to an IWMPPlayerApplication interface when a remoted Windows Media Player control is running.
     * @remarks
     * This method is used only when remoting the Windows Media Player control. If the retrieved value is null, the Player control is not embedded in remote mode.
     * 
     * This method is only accessible in C++ code or in script code in skins through the playerApplication global variable.
     * @returns {IWMPPlayerApplication} Pointer to a pointer to an <b>IWMPPlayerApplication</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplayer4-get_playerapplication
     */
    get_playerApplication() {
        result := ComCall(44, this, "ptr*", &ppIWMPPlayerApplication := 0, "HRESULT")
        return IWMPPlayerApplication(ppIWMPPlayerApplication)
    }

    /**
     * The openPlayer method opens Windows Media Player using the specified URL.
     * @remarks
     * This method launches Windows Media Player with the specified URL set as the current media item. If the Player was previously closed in skin mode it will open using the skin last chosen by the user. Otherwise, the Player opens in full mode.
     * 
     * If this method is called from a Windows Media Player ActiveX control embedded in remote mode, its behavior is identical to the <b>IWMPPlayerAppication::switchToPlayerApplication</b> method.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always returns E_NOTIMPL.
     * @param {BSTR} bstrURL <b>BSTR</b> containing the URL of the media item to play.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplayer4-openplayer
     */
    openPlayer(bstrURL) {
        bstrURL := bstrURL is String ? BSTR.Alloc(bstrURL).Value : bstrURL

        result := ComCall(45, this, BSTR, bstrURL, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMPPlayer4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_enabled := CallbackCreate(GetMethod(implObj, "get_enabled"), flags, 2)
        this.vtbl.put_enabled := CallbackCreate(GetMethod(implObj, "put_enabled"), flags, 2)
        this.vtbl.get_fullScreen := CallbackCreate(GetMethod(implObj, "get_fullScreen"), flags, 2)
        this.vtbl.put_fullScreen := CallbackCreate(GetMethod(implObj, "put_fullScreen"), flags, 2)
        this.vtbl.get_enableContextMenu := CallbackCreate(GetMethod(implObj, "get_enableContextMenu"), flags, 2)
        this.vtbl.put_enableContextMenu := CallbackCreate(GetMethod(implObj, "put_enableContextMenu"), flags, 2)
        this.vtbl.put_uiMode := CallbackCreate(GetMethod(implObj, "put_uiMode"), flags, 2)
        this.vtbl.get_uiMode := CallbackCreate(GetMethod(implObj, "get_uiMode"), flags, 2)
        this.vtbl.get_stretchToFit := CallbackCreate(GetMethod(implObj, "get_stretchToFit"), flags, 2)
        this.vtbl.put_stretchToFit := CallbackCreate(GetMethod(implObj, "put_stretchToFit"), flags, 2)
        this.vtbl.get_windowlessVideo := CallbackCreate(GetMethod(implObj, "get_windowlessVideo"), flags, 2)
        this.vtbl.put_windowlessVideo := CallbackCreate(GetMethod(implObj, "put_windowlessVideo"), flags, 2)
        this.vtbl.get_isRemote := CallbackCreate(GetMethod(implObj, "get_isRemote"), flags, 2)
        this.vtbl.get_playerApplication := CallbackCreate(GetMethod(implObj, "get_playerApplication"), flags, 2)
        this.vtbl.openPlayer := CallbackCreate(GetMethod(implObj, "openPlayer"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_enabled)
        CallbackFree(this.vtbl.put_enabled)
        CallbackFree(this.vtbl.get_fullScreen)
        CallbackFree(this.vtbl.put_fullScreen)
        CallbackFree(this.vtbl.get_enableContextMenu)
        CallbackFree(this.vtbl.put_enableContextMenu)
        CallbackFree(this.vtbl.put_uiMode)
        CallbackFree(this.vtbl.get_uiMode)
        CallbackFree(this.vtbl.get_stretchToFit)
        CallbackFree(this.vtbl.put_stretchToFit)
        CallbackFree(this.vtbl.get_windowlessVideo)
        CallbackFree(this.vtbl.put_windowlessVideo)
        CallbackFree(this.vtbl.get_isRemote)
        CallbackFree(this.vtbl.get_playerApplication)
        CallbackFree(this.vtbl.openPlayer)
    }
}
