#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IVideoWindow interface sets properties on the video window.
 * @see https://learn.microsoft.com/windows/win32/api/control/nn-control-ivideowindow
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
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-put_caption
     */
    put_Caption(strCaption) {
        strCaption := strCaption is String ? BSTR.Alloc(strCaption).Value : strCaption

        result := ComCall(7, this, "ptr", strCaption, "HRESULT")
        return result
    }

    /**
     * The get_Caption method retrieves the video window caption.
     * @remarks
     * The caller must free the returned string, using the <b>SysFreeString</b> function.
     * @returns {BSTR} Pointer to a <b>BSTR</b> that receives the caption.
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-get_caption
     */
    get_Caption() {
        strCaption := BSTR()
        result := ComCall(8, this, "ptr", strCaption, "HRESULT")
        return strCaption
    }

    /**
     * The put_WindowStyle method sets the window styles on the video window.
     * @remarks
     * This method is a thin wrapper over the <b>SetWindowLong</b> function and must be treated with care. In particular, you should retrieve the current styles and then add or remove flags. With some exceptions, flags allowed by the Windows <b>CreateWindow</b> function are acceptable. However, do not use this method to change the window size, and do not use the following flags:
     * 
     * <ul>
     * <li>WS_DISABLED</li>
     * <li>WS_HSCROLL</li>
     * <li>WS_ICONIC</li>
     * <li>WS_MAXIMIZE</li>
     * <li>WS_MINIMIZE</li>
     * <li>WS_VSCROLL</li>
     * </ul>
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
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-put_windowstyle
     */
    put_WindowStyle(WindowStyle) {
        result := ComCall(9, this, "int", WindowStyle, "HRESULT")
        return result
    }

    /**
     * The get_WindowStyle method retrieves the window styles on the video window.
     * @remarks
     * This method calls the Windows <b>GetWindowLong</b> function with the value GWL_STYLE.
     * @returns {Integer} Receives the window style flags.
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-get_windowstyle
     */
    get_WindowStyle() {
        result := ComCall(10, this, "int*", &WindowStyle := 0, "HRESULT")
        return WindowStyle
    }

    /**
     * The put_WindowStyleEx method sets the extended window styles on the video window.
     * @remarks
     * This method is a thin wrapper over the <b>SetWindowLong</b> function and must be treated with care. In particular, you should retrieve the current styles and then add or remove flags. With some exceptions, flags allowed by the Windows <b>CreateWindow</b> function are acceptable. However, do not use this method to change the window size.
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
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-put_windowstyleex
     */
    put_WindowStyleEx(WindowStyleEx) {
        result := ComCall(11, this, "int", WindowStyleEx, "HRESULT")
        return result
    }

    /**
     * The get_WindowStyleEx method retrieves the extended window styles on the video window.
     * @remarks
     * This method calls the Windows <b>GetWindowLong</b> function with the value GWL_EXSTYLE.
     * @returns {Integer} Receives the window style flags.
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-get_windowstyleex
     */
    get_WindowStyleEx() {
        result := ComCall(12, this, "int*", &WindowStyleEx := 0, "HRESULT")
        return WindowStyleEx
    }

    /**
     * The put_AutoShow method specifies whether the video renderer automatically shows the video window when it receives video data.
     * @remarks
     * By default, when the filter graph changes state to paused or running, the video renderer shows the video window and moves it to the foreground. If the user closes the window, it will not automatically reappear.
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
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-put_autoshow
     */
    put_AutoShow(AutoShow) {
        result := ComCall(13, this, "int", AutoShow, "HRESULT")
        return result
    }

    /**
     * The get_AutoShow method queries whether the video renderer automatically shows the video window when it receives video data.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-get_autoshow
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
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-put_windowstate
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
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-get_windowstate
     */
    get_WindowState() {
        result := ComCall(16, this, "int*", &WindowState := 0, "HRESULT")
        return WindowState
    }

    /**
     * The put_BackgroundPalette method specifies whether the video window realizes its palette in the background.
     * @remarks
     * If <i>BackgroundPalette</i> is <b>OATRUE</b> and the video image requires a palette, the video renderer will realize that palette in the background. Any colors that the palette uses will change to their closest match in the display palette prior to drawing. This ensures that an application will not have its palette disturbed. However, it imposes severe performance penalties on the video.
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
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-put_backgroundpalette
     */
    put_BackgroundPalette(BackgroundPalette) {
        result := ComCall(17, this, "int", BackgroundPalette, "HRESULT")
        return result
    }

    /**
     * The get_BackgroundPalette method queries whether the video window realizes its palette in the background..
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-get_backgroundpalette
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
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-put_visible
     */
    put_Visible(Visible) {
        result := ComCall(19, this, "int", Visible, "HRESULT")
        return result
    }

    /**
     * The get_Visible method queries whether the video window is visible.
     * @remarks
     * This method checks for the WS_VISIBLE style bit, by calling the Windows <b>IsWindowVisible</b> method.
     * @returns {Integer} Receives the value OATRUE if the window is visible, or OAFALSE if the window is hidden.
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-get_visible
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
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-put_left
     */
    put_Left(Left) {
        result := ComCall(21, this, "int", Left, "HRESULT")
        return result
    }

    /**
     * The get_Left method retrieves the video window's x-axis coordinate.
     * @returns {Integer} Receives the x-axis coordinate, in pixels.
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-get_left
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
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-put_width
     */
    put_Width(Width) {
        result := ComCall(23, this, "int", Width, "HRESULT")
        return result
    }

    /**
     * The get_Width method retrieves the width of the video window.
     * @returns {Integer} Receives the width, in pixels.
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-get_width
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
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-put_top
     */
    put_Top(Top) {
        result := ComCall(25, this, "int", Top, "HRESULT")
        return result
    }

    /**
     * The get_Top method retrieves the video window's y-coordinate.
     * @returns {Integer} Receives the y-coordinate, in pixels.
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-get_top
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
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-put_height
     */
    put_Height(Height) {
        result := ComCall(27, this, "int", Height, "HRESULT")
        return result
    }

    /**
     * The get_Height method retrieves the height of the video window.
     * @returns {Integer} Receives the height, in pixels.
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-get_height
     */
    get_Height() {
        result := ComCall(28, this, "int*", &pHeight := 0, "HRESULT")
        return pHeight
    }

    /**
     * The put_Owner method specifies a parent window for the video window.
     * @remarks
     * Use this method to display videos in a compound document. This method changes the parent of the video window and sets the WS_CHILD style for the video window.
     * 
     * Reset the owner to <b>NULL</b> before releasing the Filter Graph Manager. Otherwise, messages will continue to be sent to this window and errors will likely occur when the application is terminated.
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
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-put_owner
     */
    put_Owner(Owner) {
        result := ComCall(29, this, "ptr", Owner, "HRESULT")
        return result
    }

    /**
     * The get_Owner method retrieves the video window's parent window, if any.
     * @returns {Pointer} Receives a handle to the window, as an <a href="https://docs.microsoft.com/windows/desktop/DirectShow/oahwnd">OAHWND</a> type. If the video window has no parent, this parameter receives the value <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-get_owner
     */
    get_Owner() {
        result := ComCall(30, this, "ptr*", &Owner := 0, "HRESULT")
        return Owner
    }

    /**
     * The put_MessageDrain method specifies a window to receive mouse and keyboard messages from the video window.
     * @remarks
     * This method enables an application to respond to mouse and keyboard events generated within the video window.
     * 
     * If <i>Drain</i> is non-<b>NULL</b>, the video renderer forwards certain messages to the specified window, using the <b>PostMessage</b> function. Which messages are forwarded might depend on the video renderer in use. The <a href="https://docs.microsoft.com/windows/desktop/DirectShow/video-renderer-filter">Video Renderer</a> and Video Mixing Renderer (VMR) filters forward the following messages:
     * 
     * <ul>
     * <li>WM_CHAR</li>
     * <li>WM_DEADCHAR</li>
     * <li>WM_KEYDOWN</li>
     * <li>WM_KEYUP</li>
     * <li>WM_LBUTTONDBLCLK</li>
     * <li>WM_LBUTTONDOWN</li>
     * <li>WM_LBUTTONUP</li>
     * <li>WM_MBUTTONDBLCLK</li>
     * <li>WM_MBUTTONDOWN</li>
     * <li>WM_MBUTTONUP</li>
     * <li>WM_MOUSEACTIVATE</li>
     * <li>WM_MOUSEMOVE</li>
     * <li>WM_NCLBUTTONDBLCLK</li>
     * <li>WM_NCLBUTTONDOWN</li>
     * <li>WM_NCLBUTTONUP</li>
     * <li>WM_NCMBUTTONDBLCLK</li>
     * <li>WM_NCMBUTTONDOWN</li>
     * <li>WM_NCMBUTTONUP</li>
     * <li>WM_NCMOUSEMOVE</li>
     * <li>WM_NCRBUTTONDBLCLK</li>
     * <li>WM_NCRBUTTONDOWN</li>
     * <li>WM_NCRBUTTONUP</li>
     * <li>WM_RBUTTONDBLCLK</li>
     * <li>WM_RBUTTONDOWN</li>
     * <li>WM_RBUTTONUP</li>
     * <li>WM_SYSCHAR</li>
     * <li>WM_SYSDEADCHAR</li>
     * <li>WM_SYSKEYDOWN</li>
     * <li>WM_SYSKEYUP</li>
     * </ul>
     * The message drain window does not need to be a parent of the video window, so full-screen applications can use this method.
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
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-put_messagedrain
     */
    put_MessageDrain(Drain) {
        result := ComCall(31, this, "ptr", Drain, "HRESULT")
        return result
    }

    /**
     * The get_MessageDrain method retrieves the window that receives mouse and keyboard messages from the video window, if any.
     * @returns {Pointer} Receives a handle to the window, as an <a href="https://docs.microsoft.com/windows/desktop/DirectShow/oahwnd">OAHWND</a> type. If no message drain was set, this parameter receives the value <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-get_messagedrain
     */
    get_MessageDrain() {
        result := ComCall(32, this, "ptr*", &Drain := 0, "HRESULT")
        return Drain
    }

    /**
     * The get_BorderColor method retrieves the color that appears around the edges of the destination rectangle.
     * @returns {Integer} Receives a <b>COLORREF</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-get_bordercolor
     */
    get_BorderColor() {
        result := ComCall(33, this, "int*", &Color := 0, "HRESULT")
        return Color
    }

    /**
     * The put_BorderColor method sets the color that appears around the edges of the destination rectangle.
     * @remarks
     * If the destination rectangle is smaller than the client area of the video window, a border is exposed around the edges of the video. The default color is black. Use this method to override the default color. If a palette is in use, a nonsystem color is converted to its closest match.
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
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-put_bordercolor
     */
    put_BorderColor(Color) {
        result := ComCall(34, this, "int", Color, "HRESULT")
        return result
    }

    /**
     * The get_FullScreenMode method queries whether the video renderer is in full-screen mode.
     * @remarks
     * When the Filter Graph Manager is switching to full-screen mode, it calls this method to determine whether the current video renderer supports this mode. If the renderer does not have inherent support for full-screen playback, it should return E_NOTIMPL. If if does, it should return S_OK, and also return the correct value in the <i>FullScreenMode</i> parameter.
     * @returns {Integer} Receives the value OATRUE if the video renderer is in full-screen mode, or OAFALSE otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-get_fullscreenmode
     */
    get_FullScreenMode() {
        result := ComCall(35, this, "int*", &FullScreenMode := 0, "HRESULT")
        return FullScreenMode
    }

    /**
     * The put_FullScreenMode method enables or disables full-screen video rendering.
     * @remarks
     * Depending on the video renderer, the switch to full-screen mode may not be visible until the application runs or pauses the graph. In full-screen mode, if the user switches away from the application (for example, using ALT + TAB), the Filter Graph Manager sends an <a href="https://docs.microsoft.com/windows/desktop/DirectShow/ec-fullscreen-lost">EC_FULLSCREEN_LOST</a> event.
     * 
     * The following remarks describe how the Filter Graph Manager implements full-screen mode. Application developers can probably ignore this information, but it may be useful if you are writing a custom video renderer.
     * 
     * When an application switches to full-screen mode, the Filter Graph Manager searches for a video renderer that will function most efficiently. In order of preference, these are:
     * 
     * <ol>
     * <li>Any video renderer in the filter graph that natively supports full-screen mode.</li>
     * <li>Any video renderer in the filter graph that can stretch the video to full-screen without a significant performance cost.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/DirectShow/full-screen-renderer-filter">Full Screen Renderer</a> filter.</li>
     * <li>Any video renderer in the filter graph that supports <b>IVideoWindow</b>.</li>
     * </ol>
     * For the first option, the Filter Graph Manager calls <a href="https://docs.microsoft.com/windows/desktop/api/control/nf-control-ivideowindow-get_fullscreenmode">IVideoWindow::get_FullScreenMode</a> on every video renderer in the graph. Most renderers return E_NOTIMPL, indicating the filter does not natively support full-screen mode. If any renderer returns a value not equal to E_NOTIMPL, the Filter Graph Manager uses that one.
     * 
     * For the second option, the Filter Graph Manager calls <a href="https://docs.microsoft.com/windows/desktop/api/control/nf-control-ivideowindow-getmaxidealimagesize">IVideoWindow::GetMaxIdealImageSize</a> and <b>GetMinIdealImageSize</b> on every video renderer in the graph. If the size of the display falls within the filter's reported range, it indicates that the filter can stretch the video without a significant performance cost.
     * 
     * <div class="alert"><b>Note</b>  If the graph is stopped, the Filter Graph Manager pauses each renderer before calling these methods. This gives the renderer an opportunity to initialize any resources it needs, because many renderers cannot determine these values while they are stopped.</div>
     * <div> </div>
     * Except on older hardware, the second option will generally succeed. The third option is to use the Full Screen Renderer filter, adding it to the graph if necessary. The fourth option is simply to find the first renderer in the graph that supports <b>IVideoWindow</b>, and stretch the video regardless of performance.
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
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-put_fullscreenmode
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
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-setwindowforeground
     */
    SetWindowForeground(Focus) {
        result := ComCall(37, this, "int", Focus, "HRESULT")
        return result
    }

    /**
     * The NotifyOwnerMessage method forwards a message to the video window.
     * @remarks
     * The Filter Graph Manager calls this method to pass various messages to the renderer, including the following:
     * 
     * <ul>
     * <li>WM_ACTIVATEAPP</li>
     * <li>WM_DEVMODECHANGE</li>
     * <li>WM_DISPLAYCHANGE</li>
     * <li>WM_PALETTECHANGED</li>
     * <li>WM_PALETTEISCHANGING</li>
     * <li>WM_QUERYNEWPALETTE</li>
     * <li>WM_SYSCOLORCHANGE</li>
     * </ul>
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
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-notifyownermessage
     */
    NotifyOwnerMessage(hwnd, uMsg, wParam, lParam) {
        result := ComCall(38, this, "ptr", hwnd, "int", uMsg, "ptr", wParam, "ptr", lParam, "HRESULT")
        return result
    }

    /**
     * The SetWindowPosition method sets the position of the video window.
     * @remarks
     * This method has the same effect as calling the <a href="https://docs.microsoft.com/windows/desktop/api/control/nf-control-ivideowindow-put_left">IVideoWindow::put_Left</a>, <a href="https://docs.microsoft.com/windows/desktop/api/control/nf-control-ivideowindow-put_top">IVideoWindow::put_Top</a>, <a href="https://docs.microsoft.com/windows/desktop/api/control/nf-control-ivideowindow-put_width">IVideoWindow::put_Width</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/control/nf-control-ivideowindow-put_height">IVideoWindow::put_Height</a> methods.
     * 
     * If resizing the window to the specified dimensions is impossible, this method modifies the window's size and location to make the window fit. Call the <a href="https://docs.microsoft.com/windows/desktop/api/control/nf-control-ivideowindow-getwindowposition">IVideoWindow::GetWindowPosition</a> method to determine the result.
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
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-setwindowposition
     */
    SetWindowPosition(Left, Top, Width, Height) {
        result := ComCall(39, this, "int", Left, "int", Top, "int", Width, "int", Height, "HRESULT")
        return result
    }

    /**
     * The GetWindowPosition method retrieves the position of the video window.
     * @remarks
     * This method has the same effect as calling the <a href="https://docs.microsoft.com/windows/desktop/api/control/nf-control-ivideowindow-get_left">IVideoWindow::get_Left</a>, <a href="https://docs.microsoft.com/windows/desktop/api/control/nf-control-ivideowindow-get_top">IVideoWindow::get_Top</a>, <a href="https://docs.microsoft.com/windows/desktop/api/control/nf-control-ivideowindow-get_width">IVideoWindow::get_Width</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/control/nf-control-ivideowindow-get_height">IVideoWindow::get_Height</a> methods.
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
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-getwindowposition
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
     * @remarks
     * The maximum ideal size may differ from the native video size, because the video hardware might have specific stretching requirements.
     * 
     * This method returns S_FALSE under various circumstances:
     * 
     * <ul>
     * <li>The filter is using an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ioverlay">IOverlay</a> transport.</li>
     * <li>UseWhenFullScreen mode is on. (See <a href="https://docs.microsoft.com/previous-versions/ms785118(v=vs.85)">IDirectDrawVideo::UseWhenFullScreen</a>.)</li>
     * <li>Video playback is using a stretchable offscreen surface. (The <b>dwCaps</b> member of the DDCAPS structure includes the DDCAPS_BLTSTRETCH flag. See <a href="https://docs.microsoft.com/previous-versions/ms785104(v=vs.85)">IDirectDrawVideo::GetCaps</a>.)</li>
     * <li>The video surface has no minimum overlay stretch. (The <b>dwMinOverlayStretch</b> member of the DDCAPS structure is zero. See <a href="https://docs.microsoft.com/previous-versions/ms785104(v=vs.85)">IDirectDrawVideo::GetCaps</a>.)</li>
     * </ul>
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
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-getminidealimagesize
     */
    GetMinIdealImageSize(pWidth, pHeight) {
        pWidthMarshal := pWidth is VarRef ? "int*" : "ptr"
        pHeightMarshal := pHeight is VarRef ? "int*" : "ptr"

        result := ComCall(41, this, pWidthMarshal, pWidth, pHeightMarshal, pHeight, "HRESULT")
        return result
    }

    /**
     * The GetMaxIdealImageSize method retrieves the maximum ideal image size for the video image.
     * @remarks
     * The maximum ideal size may differ from the native video size, because the video hardware might have specific stretching requirements.
     * 
     * This method returns S_FALSE under various circumstances:
     * 
     * <ul>
     * <li>The filter is using an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ioverlay">IOverlay</a> transport.</li>
     * <li>UseWhenFullScreen mode is on. (See <a href="https://docs.microsoft.com/previous-versions/ms785118(v=vs.85)">IDirectDrawVideo::UseWhenFullScreen</a>.)</li>
     * <li>The video surface has no maximum overlay stretch. (The <b>dwMaxOverlayStretch</b> member of the DDCAPS structure is zero. See <a href="https://docs.microsoft.com/previous-versions/ms785104(v=vs.85)">IDirectDrawVideo::GetCaps</a>.)</li>
     * </ul>
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
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-getmaxidealimagesize
     */
    GetMaxIdealImageSize(pWidth, pHeight) {
        pWidthMarshal := pWidth is VarRef ? "int*" : "ptr"
        pHeightMarshal := pHeight is VarRef ? "int*" : "ptr"

        result := ComCall(42, this, pWidthMarshal, pWidth, pHeightMarshal, pHeight, "HRESULT")
        return result
    }

    /**
     * The GetRestorePosition method retrieves the restored window position.
     * @remarks
     * If the video window is minimized or maximized, you can use this method to get the window's restored position.
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
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-getrestoreposition
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
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-hidecursor
     */
    HideCursor(HideCursor) {
        result := ComCall(44, this, "int", HideCursor, "HRESULT")
        return result
    }

    /**
     * The IsCursorHidden method queries whether the cursor is hidden.
     * @returns {Integer} Receives the value OATRUE if the cursor is hidden, or OAFALSE if the cursor is displayed.
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-iscursorhidden
     */
    IsCursorHidden() {
        result := ComCall(45, this, "int*", &CursorHidden := 0, "HRESULT")
        return CursorHidden
    }
}
