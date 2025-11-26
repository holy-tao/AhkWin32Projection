#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IVideoWindow interface sets properties on the video window.
 * @see https://docs.microsoft.com/windows/win32/api//control/nn-control-ivideowindow
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVideoWindow extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVideoWindow
     * @type {Guid}
     */
    static IID => Guid("{56a868b4-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_Caption", "get_Caption", "put_WindowStyle", "get_WindowStyle", "put_WindowStyleEx", "get_WindowStyleEx", "put_AutoShow", "get_AutoShow", "put_WindowState", "get_WindowState", "put_BackgroundPalette", "get_BackgroundPalette", "put_Visible", "get_Visible", "put_Left", "get_Left", "put_Width", "get_Width", "put_Top", "get_Top", "put_Height", "get_Height", "put_Owner", "get_Owner", "put_MessageDrain", "get_MessageDrain", "get_BorderColor", "put_BorderColor", "get_FullScreenMode", "put_FullScreenMode", "SetWindowForeground", "NotifyOwnerMessage", "SetWindowPosition", "GetWindowPosition", "GetMinIdealImageSize", "GetMaxIdealImageSize", "GetRestorePosition", "HideCursor", "IsCursorHidden"]

    /**
     * @type {BSTR} 
     */
    Caption {
        get => this.get_Caption()
        set => this.put_Caption(value)
    }

    /**
     * @type {Integer} 
     */
    WindowStyle {
        get => this.get_WindowStyle()
        set => this.put_WindowStyle(value)
    }

    /**
     * @type {Integer} 
     */
    WindowStyleEx {
        get => this.get_WindowStyleEx()
        set => this.put_WindowStyleEx(value)
    }

    /**
     * @type {Integer} 
     */
    AutoShow {
        get => this.get_AutoShow()
        set => this.put_AutoShow(value)
    }

    /**
     * @type {Integer} 
     */
    WindowState {
        get => this.get_WindowState()
        set => this.put_WindowState(value)
    }

    /**
     * @type {Integer} 
     */
    BackgroundPalette {
        get => this.get_BackgroundPalette()
        set => this.put_BackgroundPalette(value)
    }

    /**
     * @type {Integer} 
     */
    Visible {
        get => this.get_Visible()
        set => this.put_Visible(value)
    }

    /**
     * @type {Integer} 
     */
    Left {
        get => this.get_Left()
        set => this.put_Left(value)
    }

    /**
     * @type {Integer} 
     */
    Width {
        get => this.get_Width()
        set => this.put_Width(value)
    }

    /**
     * @type {Integer} 
     */
    Top {
        get => this.get_Top()
        set => this.put_Top(value)
    }

    /**
     * @type {Integer} 
     */
    Height {
        get => this.get_Height()
        set => this.put_Height(value)
    }

    /**
     * @type {Pointer} 
     */
    Owner {
        get => this.get_Owner()
        set => this.put_Owner(value)
    }

    /**
     * @type {Pointer} 
     */
    MessageDrain {
        get => this.get_MessageDrain()
        set => this.put_MessageDrain(value)
    }

    /**
     * @type {Integer} 
     */
    BorderColor {
        get => this.get_BorderColor()
        set => this.put_BorderColor(value)
    }

    /**
     * @type {Integer} 
     */
    FullScreenMode {
        get => this.get_FullScreenMode()
        set => this.put_FullScreenMode(value)
    }

    /**
     * The put_Caption method sets the video window caption.
     * @param {BSTR} strCaption A <b>BSTR</b> that contains the caption.
     * @returns {HRESULT} Possible return values include the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The video renderer filter is not connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ivideowindow-put_caption
     */
    put_Caption(strCaption) {
        strCaption := strCaption is String ? BSTR.Alloc(strCaption).Value : strCaption

        result := ComCall(7, this, "ptr", strCaption, "HRESULT")
        return result
    }

    /**
     * The get_Caption method retrieves the video window caption.
     * @returns {BSTR} Pointer to a <b>BSTR</b> that receives the caption.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ivideowindow-get_caption
     */
    get_Caption() {
        strCaption := BSTR()
        result := ComCall(8, this, "ptr", strCaption, "HRESULT")
        return strCaption
    }

    /**
     * The put_WindowStyle method sets the window styles on the video window.
     * @param {Integer} WindowStyle One or more flags from the GWL_STYLE value of the Windows <b>SetWindowLong</b> function.
     * @returns {HRESULT} Possible return values include the following:
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The video renderer filter is not connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ivideowindow-put_windowstyle
     */
    put_WindowStyle(WindowStyle) {
        result := ComCall(9, this, "int", WindowStyle, "HRESULT")
        return result
    }

    /**
     * The get_WindowStyle method retrieves the window styles on the video window.
     * @returns {Integer} Receives the window style flags.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ivideowindow-get_windowstyle
     */
    get_WindowStyle() {
        result := ComCall(10, this, "int*", &WindowStyle := 0, "HRESULT")
        return WindowStyle
    }

    /**
     * The put_WindowStyleEx method sets the extended window styles on the video window.
     * @param {Integer} WindowStyleEx One or more flags from the GWL_EXSTYLE value of the Windows <b>SetWindowLong</b> function.
     * @returns {HRESULT} Possible return values include the following:
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The video renderer filter is not connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ivideowindow-put_windowstyleex
     */
    put_WindowStyleEx(WindowStyleEx) {
        result := ComCall(11, this, "int", WindowStyleEx, "HRESULT")
        return result
    }

    /**
     * The get_WindowStyleEx method retrieves the extended window styles on the video window.
     * @returns {Integer} Receives the window style flags.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ivideowindow-get_windowstyleex
     */
    get_WindowStyleEx() {
        result := ComCall(12, this, "int*", &WindowStyleEx := 0, "HRESULT")
        return WindowStyleEx
    }

    /**
     * The put_AutoShow method specifies whether the video renderer automatically shows the video window when it receives video data.
     * @param {Integer} AutoShow 
     * @returns {HRESULT} Possible return values include the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The video renderer filter is not connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ivideowindow-put_autoshow
     */
    put_AutoShow(AutoShow) {
        result := ComCall(13, this, "int", AutoShow, "HRESULT")
        return result
    }

    /**
     * The get_AutoShow method queries whether the video renderer automatically shows the video window when it receives video data.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ivideowindow-get_autoshow
     */
    get_AutoShow() {
        result := ComCall(14, this, "int*", &AutoShow := 0, "HRESULT")
        return AutoShow
    }

    /**
     * The put_WindowState method shows, hides, minimizes, or maximizes the video window.
     * @param {Integer} WindowState Flag that specifies how the window is to be shown. The value can be any constant defined for the <i>nCmdShow</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-showwindow">ShowWindow</a> function.
     * @returns {HRESULT} Possible return values include the following:
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The video renderer filter is not connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ivideowindow-put_windowstate
     */
    put_WindowState(WindowState) {
        result := ComCall(15, this, "int", WindowState, "HRESULT")
        return result
    }

    /**
     * The get_WindowState method queries whether the video window is visible, hidden, minimized, or maximized.
     * @returns {Integer} Receives one of the following flags:
     * 
     * <ul>
     * <li>SW_HIDE</li>
     * <li>SW_MAXIMIZE</li>
     * <li>SW_MINIMIZE</li>
     * <li>SW_SHOW</li>
     * </ul>
     * The meanings of these flags are defined by the Windows <b>ShowWindow</b> function.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ivideowindow-get_windowstate
     */
    get_WindowState() {
        result := ComCall(16, this, "int*", &WindowState := 0, "HRESULT")
        return WindowState
    }

    /**
     * The put_BackgroundPalette method specifies whether the video window realizes its palette in the background.
     * @param {Integer} BackgroundPalette 
     * @returns {HRESULT} Possible return values include the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The video renderer filter is not connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ivideowindow-put_backgroundpalette
     */
    put_BackgroundPalette(BackgroundPalette) {
        result := ComCall(17, this, "int", BackgroundPalette, "HRESULT")
        return result
    }

    /**
     * The get_BackgroundPalette method queries whether the video window realizes its palette in the background..
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ivideowindow-get_backgroundpalette
     */
    get_BackgroundPalette() {
        result := ComCall(18, this, "int*", &pBackgroundPalette := 0, "HRESULT")
        return pBackgroundPalette
    }

    /**
     * The put_Visible method shows or hides the video window.
     * @param {Integer} Visible 
     * @returns {HRESULT} Possible return values include the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The video renderer filter is not connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ivideowindow-put_visible
     */
    put_Visible(Visible) {
        result := ComCall(19, this, "int", Visible, "HRESULT")
        return result
    }

    /**
     * The get_Visible method queries whether the video window is visible.
     * @returns {Integer} Receives the value OATRUE if the window is visible, or OAFALSE if the window is hidden.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ivideowindow-get_visible
     */
    get_Visible() {
        result := ComCall(20, this, "int*", &pVisible := 0, "HRESULT")
        return pVisible
    }

    /**
     * The put_Left method sets the x-coordinate of the video window.
     * @param {Integer} Left The x-coordinate, in pixels.
     * @returns {HRESULT} Possible return values include the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The video renderer filter is not connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ivideowindow-put_left
     */
    put_Left(Left) {
        result := ComCall(21, this, "int", Left, "HRESULT")
        return result
    }

    /**
     * The get_Left method retrieves the video window's x-axis coordinate.
     * @returns {Integer} Receives the x-axis coordinate, in pixels.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ivideowindow-get_left
     */
    get_Left() {
        result := ComCall(22, this, "int*", &pLeft := 0, "HRESULT")
        return pLeft
    }

    /**
     * The put_Width method specifies the width of the video window.
     * @param {Integer} Width The width, in pixels.
     * @returns {HRESULT} Possible return values include the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The video renderer filter is not connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ivideowindow-put_width
     */
    put_Width(Width) {
        result := ComCall(23, this, "int", Width, "HRESULT")
        return result
    }

    /**
     * The get_Width method retrieves the width of the video window.
     * @returns {Integer} Receives the width, in pixels.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ivideowindow-get_width
     */
    get_Width() {
        result := ComCall(24, this, "int*", &pWidth := 0, "HRESULT")
        return pWidth
    }

    /**
     * The put_Top method specifies the y-coordinate of the video window.
     * @param {Integer} Top The y-coordinate, in pixels.
     * @returns {HRESULT} Possible return values include the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The video renderer filter is not connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ivideowindow-put_top
     */
    put_Top(Top) {
        result := ComCall(25, this, "int", Top, "HRESULT")
        return result
    }

    /**
     * The get_Top method retrieves the video window's y-coordinate.
     * @returns {Integer} Receives the y-coordinate, in pixels.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ivideowindow-get_top
     */
    get_Top() {
        result := ComCall(26, this, "int*", &pTop := 0, "HRESULT")
        return pTop
    }

    /**
     * The put_Height method sets the height of the video window.
     * @param {Integer} Height The height, in pixels.
     * @returns {HRESULT} Possible return values include the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The video renderer filter is not connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ivideowindow-put_height
     */
    put_Height(Height) {
        result := ComCall(27, this, "int", Height, "HRESULT")
        return result
    }

    /**
     * The get_Height method retrieves the height of the video window.
     * @returns {Integer} Receives the height, in pixels.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ivideowindow-get_height
     */
    get_Height() {
        result := ComCall(28, this, "int*", &pHeight := 0, "HRESULT")
        return pHeight
    }

    /**
     * The put_Owner method specifies a parent window for the video window.
     * @param {Pointer} Owner A handle to the parent window, as an <a href="https://docs.microsoft.com/windows/desktop/DirectShow/oahwnd">OAHWND</a> value, or <b>NULL</b> to remove the existing parent.
     * @returns {HRESULT} Possible return values include the following:
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The video renderer filter is not connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ivideowindow-put_owner
     */
    put_Owner(Owner) {
        result := ComCall(29, this, "ptr", Owner, "HRESULT")
        return result
    }

    /**
     * The get_Owner method retrieves the video window's parent window, if any.
     * @returns {Pointer} Receives a handle to the window, as an <a href="https://docs.microsoft.com/windows/desktop/DirectShow/oahwnd">OAHWND</a> type. If the video window has no parent, this parameter receives the value <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ivideowindow-get_owner
     */
    get_Owner() {
        result := ComCall(30, this, "ptr*", &Owner := 0, "HRESULT")
        return Owner
    }

    /**
     * The put_MessageDrain method specifies a window to receive mouse and keyboard messages from the video window.
     * @param {Pointer} Drain A handle to the window, as an <a href="https://docs.microsoft.com/windows/desktop/DirectShow/oahwnd">OAHWND</a> value.
     * @returns {HRESULT} Possible return values include the following:
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The video renderer filter is not connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ivideowindow-put_messagedrain
     */
    put_MessageDrain(Drain) {
        result := ComCall(31, this, "ptr", Drain, "HRESULT")
        return result
    }

    /**
     * The get_MessageDrain method retrieves the window that receives mouse and keyboard messages from the video window, if any.
     * @returns {Pointer} Receives a handle to the window, as an <a href="https://docs.microsoft.com/windows/desktop/DirectShow/oahwnd">OAHWND</a> type. If no message drain was set, this parameter receives the value <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ivideowindow-get_messagedrain
     */
    get_MessageDrain() {
        result := ComCall(32, this, "ptr*", &Drain := 0, "HRESULT")
        return Drain
    }

    /**
     * The get_BorderColor method retrieves the color that appears around the edges of the destination rectangle.
     * @returns {Integer} Receives a <b>COLORREF</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ivideowindow-get_bordercolor
     */
    get_BorderColor() {
        result := ComCall(33, this, "int*", &Color := 0, "HRESULT")
        return Color
    }

    /**
     * The put_BorderColor method sets the color that appears around the edges of the destination rectangle.
     * @param {Integer} Color The border color, specified as a <b>COLORREF</b> value.
     * @returns {HRESULT} Possible return values include the following:
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The video renderer filter is not connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ivideowindow-put_bordercolor
     */
    put_BorderColor(Color) {
        result := ComCall(34, this, "int", Color, "HRESULT")
        return result
    }

    /**
     * The get_FullScreenMode method queries whether the video renderer is in full-screen mode.
     * @returns {Integer} Receives the value OATRUE if the video renderer is in full-screen mode, or OAFALSE otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ivideowindow-get_fullscreenmode
     */
    get_FullScreenMode() {
        result := ComCall(35, this, "int*", &FullScreenMode := 0, "HRESULT")
        return FullScreenMode
    }

    /**
     * The put_FullScreenMode method enables or disables full-screen video rendering.
     * @param {Integer} FullScreenMode 
     * @returns {HRESULT} Possible return values include the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Filter does not support full-screen mode.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Already in the requested mode.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NO_FULLSCREEN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not find any filter that supports full-screen mode.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ivideowindow-put_fullscreenmode
     */
    put_FullScreenMode(FullScreenMode) {
        result := ComCall(36, this, "int", FullScreenMode, "HRESULT")
        return result
    }

    /**
     * The SetWindowForeground method places the video window at the top of the Z order.
     * @param {Integer} Focus 
     * @returns {HRESULT} Possible return values include the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The video renderer filter is not connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ivideowindow-setwindowforeground
     */
    SetWindowForeground(Focus) {
        result := ComCall(37, this, "int", Focus, "HRESULT")
        return result
    }

    /**
     * The NotifyOwnerMessage method forwards a message to the video window.
     * @param {Pointer} hwnd A handle to the window, as an <a href="https://docs.microsoft.com/windows/desktop/DirectShow/oahwnd">OAHWND</a> value.
     * @param {Integer} uMsg Specifies the message.
     * @param {Pointer} wParam Message parameter.
     * @param {Pointer} lParam Message parameter.
     * @returns {HRESULT} Possible return values include the following:
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The video renderer filter is not connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ivideowindow-notifyownermessage
     */
    NotifyOwnerMessage(hwnd, uMsg, wParam, lParam) {
        result := ComCall(38, this, "ptr", hwnd, "int", uMsg, "ptr", wParam, "ptr", lParam, "HRESULT")
        return result
    }

    /**
     * The SetWindowPosition method sets the position of the video window.
     * @param {Integer} Left The x-coordinate, in pixels.
     * @param {Integer} Top The y-coordinate, in pixels.
     * @param {Integer} Width The width, in pixels.
     * @param {Integer} Height The height, in pixels.
     * @returns {HRESULT} Possible return values include the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The video renderer filter is not connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ivideowindow-setwindowposition
     */
    SetWindowPosition(Left, Top, Width, Height) {
        result := ComCall(39, this, "int", Left, "int", Top, "int", Width, "int", Height, "HRESULT")
        return result
    }

    /**
     * The GetWindowPosition method retrieves the position of the video window.
     * @param {Pointer<Integer>} pLeft Receives the x-coordinate, in pixels.
     * @param {Pointer<Integer>} pTop Receives the y-coordinate, in pixels.
     * @param {Pointer<Integer>} pWidth Receives the width of the window, in pixels.
     * @param {Pointer<Integer>} pHeight Receives the height of the window, in pixels.
     * @returns {HRESULT} Possible return values include the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The video renderer filter is not connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ivideowindow-getwindowposition
     */
    GetWindowPosition(pLeft, pTop, pWidth, pHeight) {
        pLeftMarshal := pLeft is VarRef ? "int*" : "ptr"
        pTopMarshal := pTop is VarRef ? "int*" : "ptr"
        pWidthMarshal := pWidth is VarRef ? "int*" : "ptr"
        pHeightMarshal := pHeight is VarRef ? "int*" : "ptr"

        result := ComCall(40, this, pLeftMarshal, pLeft, pTopMarshal, pTop, pWidthMarshal, pWidth, pHeightMarshal, pHeight, "HRESULT")
        return result
    }

    /**
     * The GetMinIdealImageSize method retrieves the minimum ideal size for the video image.
     * @param {Pointer<Integer>} pWidth Receives the minimum ideal width, in pixels.
     * @param {Pointer<Integer>} pHeight Receives the minimum ideal height, in pixels.
     * @returns {HRESULT} Possible return values include the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not retrieve a minimum image size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_WRONG_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Filter is stopped.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ivideowindow-getminidealimagesize
     */
    GetMinIdealImageSize(pWidth, pHeight) {
        pWidthMarshal := pWidth is VarRef ? "int*" : "ptr"
        pHeightMarshal := pHeight is VarRef ? "int*" : "ptr"

        result := ComCall(41, this, pWidthMarshal, pWidth, pHeightMarshal, pHeight, "HRESULT")
        return result
    }

    /**
     * The GetMaxIdealImageSize method retrieves the maximum ideal image size for the video image.
     * @param {Pointer<Integer>} pWidth Receives the maximum ideal width, in pixels.
     * @param {Pointer<Integer>} pHeight Receives the maximum ideal height, in pixels.
     * @returns {HRESULT} Possible return values include the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not retrieve a maximum image size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_WRONG_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Filter is stopped.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ivideowindow-getmaxidealimagesize
     */
    GetMaxIdealImageSize(pWidth, pHeight) {
        pWidthMarshal := pWidth is VarRef ? "int*" : "ptr"
        pHeightMarshal := pHeight is VarRef ? "int*" : "ptr"

        result := ComCall(42, this, pWidthMarshal, pWidth, pHeightMarshal, pHeight, "HRESULT")
        return result
    }

    /**
     * The GetRestorePosition method retrieves the restored window position.
     * @param {Pointer<Integer>} pLeft Receives the x-coordinate, in pixels.
     * @param {Pointer<Integer>} pTop Receives the y-coordinate, in pixels.
     * @param {Pointer<Integer>} pWidth Receives the width of the window, in pixels.
     * @param {Pointer<Integer>} pHeight Receives the height of the window, in pixels.
     * @returns {HRESULT} Possible return values include the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The video renderer filter is not connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ivideowindow-getrestoreposition
     */
    GetRestorePosition(pLeft, pTop, pWidth, pHeight) {
        pLeftMarshal := pLeft is VarRef ? "int*" : "ptr"
        pTopMarshal := pTop is VarRef ? "int*" : "ptr"
        pWidthMarshal := pWidth is VarRef ? "int*" : "ptr"
        pHeightMarshal := pHeight is VarRef ? "int*" : "ptr"

        result := ComCall(43, this, pLeftMarshal, pLeft, pTopMarshal, pTop, pWidthMarshal, pWidth, pHeightMarshal, pHeight, "HRESULT")
        return result
    }

    /**
     * The HideCursor method shows or hides the cursor when the mouse is positioned over the video window.
     * @param {Integer} HideCursor 
     * @returns {HRESULT} Possible return values include the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The video renderer filter is not connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ivideowindow-hidecursor
     */
    HideCursor(HideCursor) {
        result := ComCall(44, this, "int", HideCursor, "HRESULT")
        return result
    }

    /**
     * The IsCursorHidden method queries whether the cursor is hidden.
     * @returns {Integer} Receives the value OATRUE if the cursor is hidden, or OAFALSE if the cursor is displayed.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-ivideowindow-iscursorhidden
     */
    IsCursorHidden() {
        result := ComCall(45, this, "int*", &CursorHidden := 0, "HRESULT")
        return CursorHidden
    }
}
