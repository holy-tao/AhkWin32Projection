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
     * The get_enabled method retrieves a value indicating whether the Windows Media Player control is enabled.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpplayer-get_enabled
     */
    get_enabled(pbEnabled) {
        pbEnabledMarshal := pbEnabled is VarRef ? "short*" : "ptr"

        result := ComCall(28, this, pbEnabledMarshal, pbEnabled, "HRESULT")
        return result
    }

    /**
     * The put_enabled method specifies a value indicating whether the Windows Media Player control is enabled.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpplayer-put_enabled
     */
    put_enabled(bEnabled) {
        result := ComCall(29, this, "short", bEnabled, "HRESULT")
        return result
    }

    /**
     * The get_fullScreen method retrieves a value indicating whether video content is played back in full-screen mode.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpplayer-get_fullscreen
     */
    get_fullScreen(pbFullScreen) {
        pbFullScreenMarshal := pbFullScreen is VarRef ? "short*" : "ptr"

        result := ComCall(30, this, pbFullScreenMarshal, pbFullScreen, "HRESULT")
        return result
    }

    /**
     * The put_fullScreen method specifies a value indicating whether video content is played back in full-screen mode.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpplayer-put_fullscreen
     */
    put_fullScreen(bFullScreen) {
        result := ComCall(31, this, "short", bFullScreen, "HRESULT")
        return result
    }

    /**
     * The get_enableContextMenu method retrieves a value indicating whether to enable the context menu, which appears when the right mouse button is clicked.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpplayer-get_enablecontextmenu
     */
    get_enableContextMenu(pbEnableContextMenu) {
        pbEnableContextMenuMarshal := pbEnableContextMenu is VarRef ? "short*" : "ptr"

        result := ComCall(32, this, pbEnableContextMenuMarshal, pbEnableContextMenu, "HRESULT")
        return result
    }

    /**
     * The put_enableContextMenu method specifies a value indicating whether to enable the context menu, which appears when the right mouse button is clicked.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpplayer-put_enablecontextmenu
     */
    put_enableContextMenu(bEnableContextMenu) {
        result := ComCall(33, this, "short", bEnableContextMenu, "HRESULT")
        return result
    }

    /**
     * The put_uiMode method specifies a value indicating which controls are shown in the user interface.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpplayer-put_uimode
     */
    put_uiMode(bstrMode) {
        bstrMode := bstrMode is String ? BSTR.Alloc(bstrMode).Value : bstrMode

        result := ComCall(34, this, "ptr", bstrMode, "HRESULT")
        return result
    }

    /**
     * The get_uiMode method retrieves a value indicating which controls are shown in the user interface.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpplayer-get_uimode
     */
    get_uiMode(pbstrMode) {
        result := ComCall(35, this, "ptr", pbstrMode, "HRESULT")
        return result
    }
}
