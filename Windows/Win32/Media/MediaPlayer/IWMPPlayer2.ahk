#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IWMPCore.ahk" { IWMPCore }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * The IWMPPlayer2 interface provides additional methods for modifying the basic behavior of the Windows Media Player control user interface.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpplayer2
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPPlayer2 extends IWMPCore {
    /**
     * The interface identifier for IWMPPlayer2
     * @type {Guid}
     */
    static IID := Guid("{0e6b01d1-d407-4c85-bf5f-1c01f6150280}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPPlayer2 interfaces
    */
    struct Vtbl extends IWMPCore.Vtbl {
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
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPPlayer2.Vtbl()
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
     * 
     * @param {Pointer<VARIANT_BOOL>} pbEnabled 
     * @returns {HRESULT} 
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
     */
    put_enabled(bEnabled) {
        result := ComCall(29, this, VARIANT_BOOL, bEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbFullScreen 
     * @returns {HRESULT} 
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
     */
    put_fullScreen(bFullScreen) {
        result := ComCall(31, this, VARIANT_BOOL, bFullScreen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbEnableContextMenu 
     * @returns {HRESULT} 
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
     */
    put_enableContextMenu(bEnableContextMenu) {
        result := ComCall(33, this, VARIANT_BOOL, bEnableContextMenu, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrMode 
     * @returns {HRESULT} 
     */
    put_uiMode(bstrMode) {
        bstrMode := bstrMode is String ? BSTR.Alloc(bstrMode).Value : bstrMode

        result := ComCall(34, this, BSTR, bstrMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrMode 
     * @returns {HRESULT} 
     */
    get_uiMode(pbstrMode) {
        result := ComCall(35, this, BSTR.Ptr, pbstrMode, "HRESULT")
        return result
    }

    /**
     * The get_stretchToFit method retrieves a value indicating whether video displayed by the Windows Media Player control automatically sizes to fit the video window when the video window is larger than the dimensions of the video image.
     * @remarks
     * When the <b>VARIANT_BOOL</b> retrieved by <b>get_stretchToFit</b> equals <b>TRUE</b>, the Windows Media Player control maintains the original aspect ratio of the video. If the aspect ratio of the video does not match the aspect ratio of the video window, black mask areas may appear on either the top and bottom or left and right of the video image.
     * 
     * This method applies to the Windows Media Player control only when embedded in a webpage.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always retrieves a <b>VARIANT_BOOL</b> set to <b>FALSE</b>.
     * @param {Pointer<VARIANT_BOOL>} pbEnabled Pointer to a <b>VARIANT_BOOL</b> indicating whether video displayed by the Windows Media Player control automatically resizes.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplayer2-get_stretchtofit
     */
    get_stretchToFit(pbEnabled) {
        pbEnabledMarshal := pbEnabled is VarRef ? "short*" : "ptr"

        result := ComCall(36, this, pbEnabledMarshal, pbEnabled, "HRESULT")
        return result
    }

    /**
     * The put_stretchToFit method specifies a value indicating whether video displayed by the Windows Media Player control automatically sizes to fit the video window when the video window is larger than the dimensions of the video image.
     * @remarks
     * When the <b>VARIANT_BOOL</b> specified in <b>put_stretchToFit</b> is set to <b>TRUE</b>, the Windows Media Player control maintains the original aspect ratio of the video. If the aspect ratio of the video does not match the aspect ratio of the video window, black mask areas may appear on either the top and bottom or left and right of the video image.
     * 
     * This method applies to the Windows Media Player control only when embedded in a webpage.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always returns E_INVALIDARG.
     * @param {VARIANT_BOOL} bEnabled <b>VARIANT_BOOL</b> indicating whether video displayed by the Windows Media Player control automatically resizes.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplayer2-put_stretchtofit
     */
    put_stretchToFit(bEnabled) {
        result := ComCall(37, this, VARIANT_BOOL, bEnabled, "HRESULT")
        return result
    }

    /**
     * The get_windowlessVideo method retrieves a value indicating whether the Windows Media Player control renders video in windowless mode.
     * @remarks
     * By default, an embedded Windows Media Player control renders video in its own window within the client area. When the <b>VARIANT_BOOL</b> retrieved by <b>get_windowlessVideo</b> equals <b>TRUE</b>, the Windows Media Player object renders video directly in the client area, so you can apply special effects or layer the video with text.
     * 
     * In Windows Vista, rendering video in windowless mode can degrade performance.
     * 
     * The <b>get_windowlessVideo</b> method is not supported for Netscape Navigator. Setting a value for this property in Navigator may yield unexpected results.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always retrieves a <b>VARIANT_BOOL</b> set to <b>FALSE</b>.
     * @param {Pointer<VARIANT_BOOL>} pbEnabled Pointer to a <b>VARIANT_BOOL</b> indicating whether the Windows Media Player control renders video in windowless mode.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplayer2-get_windowlessvideo
     */
    get_windowlessVideo(pbEnabled) {
        pbEnabledMarshal := pbEnabled is VarRef ? "short*" : "ptr"

        result := ComCall(38, this, pbEnabledMarshal, pbEnabled, "HRESULT")
        return result
    }

    /**
     * The put_windowlessVideo method specifies a value indicating whether the Windows Media Player control renders video in windowless mode.
     * @remarks
     * By default, an embedded Windows Media Player control renders video in its own window within the client area. When the <b>VARIANT_BOOL</b> specified in <b>put_windowlessVideo</b> is set to <b>TRUE</b>, the Windows Media Player object renders video directly in the client area, so you can apply special effects or layer the video with text.
     * 
     * In Windows Vista, rendering video in windowless mode can degrade performance.
     * 
     * The <b>put_windowlessVideo</b> method is not supported for Netscape Navigator. Setting a value for this property in Navigator may yield unexpected results.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always returns E_INVALIDARG.
     * @param {VARIANT_BOOL} bEnabled <b>VARIANT_BOOL</b> indicating whether the Windows Media Player control renders video in windowless mode.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplayer2-put_windowlessvideo
     */
    put_windowlessVideo(bEnabled) {
        result := ComCall(39, this, VARIANT_BOOL, bEnabled, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMPPlayer2.IID.Equals(iid)) {
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
    }
}
