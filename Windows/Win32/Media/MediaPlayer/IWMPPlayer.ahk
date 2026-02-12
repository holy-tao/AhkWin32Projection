#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWMPCore.ahk

/**
 * The IWMPPlayer interface provides methods for modifying the basic behavior of the Windows Media Player control user interface. These methods supplement the IWMPCore interface.
 * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nn-wmp-iwmpplayer
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
     * The get_enabled method retrieves a value indicating whether the Windows Media Player control is enabled.
     * @remarks
     * If the <b>VARIANT_BOOL</b> received from <b>get_enabled</b> equals <b>FALSE</b>, then Windows Media Player hides the user controls during full-screen playback.
     * @param {Pointer<VARIANT_BOOL>} pbEnabled Pointer to a <b>VARIANT_BOOL</b> indicating whether the Windows Media Player control is enabled.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpplayer-get_enabled
     */
    get_enabled(pbEnabled) {
        pbEnabledMarshal := pbEnabled is VarRef ? "short*" : "ptr"

        result := ComCall(28, this, pbEnabledMarshal, pbEnabled, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The put_enabled method specifies a value indicating whether the Windows Media Player control is enabled.
     * @remarks
     * If the <b>VARIANT_BOOL</b> specified in <b>put_enabled</b> is set to <b>FALSE</b>, then Windows Media Player hides the user controls during full-screen playback.
     * @param {VARIANT_BOOL} bEnabled <b>VARIANT_BOOL</b> indicating whether the Windows Media Player control is enabled.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpplayer-put_enabled
     */
    put_enabled(bEnabled) {
        result := ComCall(29, this, "short", bEnabled, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The get_fullScreen method retrieves a value indicating whether video content is played back in full-screen mode.
     * @remarks
     * For full-screen mode to work properly when embedding the Windows Media Player control, the video display area must have a height and width of at least one pixel. If the <b>BSTR</b> specified in <b>IWMPPlayer::put_uiMode</b> is set to "mini" or "full", the height of the control itself must be 65 pixels or greater to accommodate the video display area in addition to the user interface.
     * 
     * If the <b>BSTR</b> specified in <b>IWMPPlayer::put_uiMode</b> is set to "invisible", then specifying the <b>VARIANT_BOOL</b> to <b>TRUE</b> in <b>get_fullScreen</b> raises an error and does not affect the behavior of the control.
     * 
     * During full-screen playback, Windows Media Player hides the mouse cursor when the <b>VARIANT_BOOL</b> retrieved from <b>IWMPPlayer::get_enableContextMenu</b> equals <b>FALSE</b> and the <b>BSTR</b> retrieved from <b>IWMPPlayer::get_uiMode</b> equals "none".
     * 
     * If the <b>BSTR</b> specified in <b>IWMPPlayer::put_uiMode</b> is set to "full" or "mini", Windows Media Player displays transport controls in full-screen mode when the mouse cursor moves. After a brief interval of no mouse movement, the transport controls are hidden. If the <b>BSTR</b> specified in <b>IWMPPlayer::put_uiMode</b> is set to "none", no controls are displayed in full-screen mode.
     * 
     * Note
     *         
     * 
     * Displaying transport controls in full-screen mode requires the Windows XP operating system.
     * 
     * If transport controls are not displayed in full-screen mode, then Windows Media Player automatically exits full-screen mode when playback stops.
     * @param {Pointer<VARIANT_BOOL>} pbFullScreen Pointer to a <b>VARIANT_BOOL</b> indicating whether video content is played back in full-screen mode. The default is <b>FALSE</b>.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpplayer-get_fullscreen
     */
    get_fullScreen(pbFullScreen) {
        pbFullScreenMarshal := pbFullScreen is VarRef ? "short*" : "ptr"

        result := ComCall(30, this, pbFullScreenMarshal, pbFullScreen, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The put_fullScreen method specifies a value indicating whether video content is played back in full-screen mode.
     * @remarks
     * For full-screen mode to work properly when embedding the Windows Media Player control, the video display area must have a height and width of at least one pixel. If the <b>BSTR</b> specified in <b>IWMPPlayer::put_uiMode</b> is set to "mini" or "full", the height of the control itself must be 65 pixels or greater to accommodate the video display area in addition to the user interface.
     * 
     * If the <b>BSTR</b> specified in <b>IWMPPlayer::put_uiMode</b> is set to "invisible", then specifying the <b>VARIANT_BOOL</b> to <b>TRUE</b> in <b>IWMPPlayer::get_fullScreen</b> raises an error and does not affect the behavior of the control.
     * 
     * During full-screen playback, Windows Media Player hides the mouse cursor when the <b>VARIANT_BOOL</b> retrieved from <b>IWMPPlayer::get_enableContextMenu</b> equals <b>FALSE</b> and the <b>BSTR</b> retrieved from <b>IWMPPlayer::get_uiMode</b> equals "none".
     * 
     * If the <b>BSTR</b> specified in <b>IWMPPlayer::put_uiMode</b> is set to "full" or "mini", Windows Media Player displays transport controls in full-screen mode when the mouse cursor moves. After a brief interval of no mouse movement, the transport controls are hidden. If the <b>BSTR</b> specified in <b>IWMPPlayer::put_uiMode</b> is set to "none", no controls are displayed in full-screen mode.
     * 
     * Note
     *         
     * 
     * Displaying transport controls in full-screen mode requires the Windows XP operating system.
     * 
     * If transport controls are not displayed in full-screen mode, then Windows Media Player automatically exits full-screen mode when playback stops.
     * @param {VARIANT_BOOL} bFullScreen <b>VARIANT_BOOL</b> indicating whether video content is played back in full-screen mode. The default is <b>FALSE</b>.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpplayer-put_fullscreen
     */
    put_fullScreen(bFullScreen) {
        result := ComCall(31, this, "short", bFullScreen, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The get_enableContextMenu method retrieves a value indicating whether to enable the context menu, which appears when the right mouse button is clicked.
     * @remarks
     * During full-screen playback, Windows Media Player hides the mouse cursor when the <b>VARIANT_BOOL</b> retrieved by <b>get_enableContextMenu</b> equals <b>FALSE</b> and the <b>BSTR</b> retrieved by <b>IWMPPlayer::get_uiMode</b> equals "none".
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always retrieves a <b>VARIANT_BOOL</b> set to <b>FALSE</b>.
     * @param {Pointer<VARIANT_BOOL>} pbEnableContextMenu Pointer to a <b>VARIANT_BOOL</b> that indicates whether to the enable context menu. The default is <b>TRUE</b>.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpplayer-get_enablecontextmenu
     */
    get_enableContextMenu(pbEnableContextMenu) {
        pbEnableContextMenuMarshal := pbEnableContextMenu is VarRef ? "short*" : "ptr"

        result := ComCall(32, this, pbEnableContextMenuMarshal, pbEnableContextMenu, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The put_enableContextMenu method specifies a value indicating whether to enable the context menu, which appears when the right mouse button is clicked.
     * @remarks
     * During full-screen playback, Windows Media Player hides the mouse cursor when the <b>VARIANT_BOOL</b> retrieved by <b>IWMPPlayer::get_enableContextMenu</b> equals <b>FALSE</b> and the <b>BSTR</b> retrieved by <b>IWMPPlayer::get_uiMode</b> equals "none".
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always returns E_INVALIDARG.
     * @param {VARIANT_BOOL} bEnableContextMenu <b>VARIANT_BOOL</b> that indicates whether to the enable context menu. The default is <b>TRUE</b>.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpplayer-put_enablecontextmenu
     */
    put_enableContextMenu(bEnableContextMenu) {
        result := ComCall(33, this, "short", bEnableContextMenu, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The put_uiMode method specifies a value indicating which controls are shown in the user interface.
     * @remarks
     * This method specifies the appearance of the embedded Windows Media Player. When the <b>BSTR</b> specified in <b>put_uiMode</b> is set to "none", "mini", or "full", a window is present for the display of video clips and audio visualizations. This window can be hidden in mini or full mode by setting the <b>height</b> attribute of the <b>OBJECT</b> tag to 40, which is measured from the bottom, and leaves the controls portion of the user interface visible. If no embedded interface is desired, set both the <b>width</b> and <b>height</b> attributes to zero.
     * 
     * If the <b>BSTR</b> specified in <b>put_uiMode</b> is set to "invisible", no user interface is displayed, but space is still reserved on the page as specified by <b>width</b> and <b>height</b>. This is useful for retaining page layout whenever the UI mode changes. Additionally, the reserved space is transparent, so any elements layered behind the control will be visible.
     * 
     * If the <b>BSTR</b> specified in <b>put_uiMode</b> is set to "full" or "mini", Windows Media Player displays transport controls in full-screen mode. If the <b>BSTR</b> specified in <b>put_uiMode</b> is set to "none", no controls are displayed in full-screen mode.
     * 
     * If the window is visible and audio content is being played, the visualization displayed will be the one most recently used in Windows Media Player.
     * 
     * If the <b>BSTR</b> specified in <b>put_uiMode</b> is set to "custom" in a C++ program that implements <b>IWMPRemoteMediaServices</b>, the skin file indicated by <b>IWMPRemoteMediaServices::GetCustomUIMode</b> is displayed.
     * 
     * During full-screen playback, Windows Media Player hides the mouse cursor when the <b>VARIANT_BOOL</b> retrieved from <b>IWMPPlayer::get_enableContextMenu</b> equals <b>FALSE</b> and the <b>BSTR</b> retrieved from <b>IWMPPlayer::get_uiMode</b> equals "none".
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method only specifies a <b>BSTR</b> set to "none" or "full". On Smartphone devices, only playback status and a counter are displayed when setting <b>uiMode</b> to "full".
     * @param {BSTR} bstrMode 
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpplayer-put_uimode
     */
    put_uiMode(bstrMode) {
        if(bstrMode is String) {
            pin := BSTR.Alloc(bstrMode)
            bstrMode := pin.Value
        }

        result := ComCall(34, this, "ptr", bstrMode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The get_uiMode method retrieves a value indicating which controls are shown in the user interface.
     * @remarks
     * This method retrieves the appearance of the embedded Windows Media Player. When the <b>BSTR</b> retrieved from <b>get_uiMode</b> is "none", "mini", or "full", a window is present for the display of video clips and audio visualizations. This window can be hidden in mini or full mode by setting the <b>height</b> attribute of the <b>OBJECT</b> tag to 40, which is measured from the bottom, and leaves the controls portion of the user interface visible. If no embedded interface is desired, set both the <b>width</b> and <b>height</b> attributes to zero.
     * 
     * If the <b>BSTR</b> retrieved from <b>get_uiMode</b> is "invisible", no user interface is displayed, but space is still reserved on the page as specified by <b>width</b> and <b>height</b>. This is useful for retaining page layout whenever the UI mode changes. Additionally, the reserved space is transparent, so any elements layered behind the control will be visible.
     * 
     * If the <b>BSTR</b> retrieved from <b>get_uiMode</b> is "full" or "mini", Windows Media Player displays transport controls in full-screen mode. If the <b>BSTR</b> retrieved from <b>get_uiMode</b> is "none", no controls are displayed in full-screen mode.
     * 
     * If the window is visible and audio content is being played, the visualization displayed will be the one most recently used in Windows Media Player.
     * 
     * If the <b>BSTR</b> retrieved from <b>get_uiMode</b> is "custom" in a C++ program that implements <b>IWMPRemoteMediaServices</b>, the skin file indicated by <b>IWMPRemoteMediaServices::GetCustomUIMode</b> is displayed.
     * 
     * During full-screen playback, Windows Media Player hides the mouse cursor when the <b>VARIANT_BOOL</b> received from <b>IWMPPlayer::get_enableContextMenu</b> equals <b>FALSE</b> and the <b>BSTR</b> received from <b>get_uiMode</b> equals "none".
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method only retrieves a <b>BSTR</b> set to "none" or "full". On Smartphone devices, only playback status and a counter are displayed when <b>uiMode</b> is set to "full".
     * @param {Pointer<BSTR>} pbstrMode 
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpplayer-get_uimode
     */
    get_uiMode(pbstrMode) {
        result := ComCall(35, this, "ptr", pbstrMode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
