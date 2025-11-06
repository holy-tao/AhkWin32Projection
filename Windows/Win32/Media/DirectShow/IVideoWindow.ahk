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
     * 
     * @param {BSTR} strCaption 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-put_caption
     */
    put_Caption(strCaption) {
        strCaption := strCaption is String ? BSTR.Alloc(strCaption).Value : strCaption

        result := ComCall(7, this, "ptr", strCaption, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-get_caption
     */
    get_Caption() {
        strCaption := BSTR()
        result := ComCall(8, this, "ptr", strCaption, "HRESULT")
        return strCaption
    }

    /**
     * 
     * @param {Integer} WindowStyle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-put_windowstyle
     */
    put_WindowStyle(WindowStyle) {
        result := ComCall(9, this, "int", WindowStyle, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-get_windowstyle
     */
    get_WindowStyle() {
        result := ComCall(10, this, "int*", &WindowStyle := 0, "HRESULT")
        return WindowStyle
    }

    /**
     * 
     * @param {Integer} WindowStyleEx 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-put_windowstyleex
     */
    put_WindowStyleEx(WindowStyleEx) {
        result := ComCall(11, this, "int", WindowStyleEx, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-get_windowstyleex
     */
    get_WindowStyleEx() {
        result := ComCall(12, this, "int*", &WindowStyleEx := 0, "HRESULT")
        return WindowStyleEx
    }

    /**
     * 
     * @param {Integer} AutoShow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-put_autoshow
     */
    put_AutoShow(AutoShow) {
        result := ComCall(13, this, "int", AutoShow, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-get_autoshow
     */
    get_AutoShow() {
        result := ComCall(14, this, "int*", &AutoShow := 0, "HRESULT")
        return AutoShow
    }

    /**
     * 
     * @param {Integer} WindowState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-put_windowstate
     */
    put_WindowState(WindowState) {
        result := ComCall(15, this, "int", WindowState, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-get_windowstate
     */
    get_WindowState() {
        result := ComCall(16, this, "int*", &WindowState := 0, "HRESULT")
        return WindowState
    }

    /**
     * 
     * @param {Integer} BackgroundPalette 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-put_backgroundpalette
     */
    put_BackgroundPalette(BackgroundPalette) {
        result := ComCall(17, this, "int", BackgroundPalette, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-get_backgroundpalette
     */
    get_BackgroundPalette() {
        result := ComCall(18, this, "int*", &pBackgroundPalette := 0, "HRESULT")
        return pBackgroundPalette
    }

    /**
     * 
     * @param {Integer} Visible 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-put_visible
     */
    put_Visible(Visible) {
        result := ComCall(19, this, "int", Visible, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-get_visible
     */
    get_Visible() {
        result := ComCall(20, this, "int*", &pVisible := 0, "HRESULT")
        return pVisible
    }

    /**
     * 
     * @param {Integer} Left 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-put_left
     */
    put_Left(Left) {
        result := ComCall(21, this, "int", Left, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-get_left
     */
    get_Left() {
        result := ComCall(22, this, "int*", &pLeft := 0, "HRESULT")
        return pLeft
    }

    /**
     * 
     * @param {Integer} Width 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-put_width
     */
    put_Width(Width) {
        result := ComCall(23, this, "int", Width, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-get_width
     */
    get_Width() {
        result := ComCall(24, this, "int*", &pWidth := 0, "HRESULT")
        return pWidth
    }

    /**
     * 
     * @param {Integer} Top 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-put_top
     */
    put_Top(Top) {
        result := ComCall(25, this, "int", Top, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-get_top
     */
    get_Top() {
        result := ComCall(26, this, "int*", &pTop := 0, "HRESULT")
        return pTop
    }

    /**
     * 
     * @param {Integer} Height 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-put_height
     */
    put_Height(Height) {
        result := ComCall(27, this, "int", Height, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-get_height
     */
    get_Height() {
        result := ComCall(28, this, "int*", &pHeight := 0, "HRESULT")
        return pHeight
    }

    /**
     * 
     * @param {Pointer} Owner 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-put_owner
     */
    put_Owner(Owner) {
        result := ComCall(29, this, "ptr", Owner, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-get_owner
     */
    get_Owner() {
        result := ComCall(30, this, "ptr*", &Owner := 0, "HRESULT")
        return Owner
    }

    /**
     * 
     * @param {Pointer} Drain 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-put_messagedrain
     */
    put_MessageDrain(Drain) {
        result := ComCall(31, this, "ptr", Drain, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-get_messagedrain
     */
    get_MessageDrain() {
        result := ComCall(32, this, "ptr*", &Drain := 0, "HRESULT")
        return Drain
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-get_bordercolor
     */
    get_BorderColor() {
        result := ComCall(33, this, "int*", &Color := 0, "HRESULT")
        return Color
    }

    /**
     * 
     * @param {Integer} Color 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-put_bordercolor
     */
    put_BorderColor(Color) {
        result := ComCall(34, this, "int", Color, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-get_fullscreenmode
     */
    get_FullScreenMode() {
        result := ComCall(35, this, "int*", &FullScreenMode := 0, "HRESULT")
        return FullScreenMode
    }

    /**
     * 
     * @param {Integer} FullScreenMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-put_fullscreenmode
     */
    put_FullScreenMode(FullScreenMode) {
        result := ComCall(36, this, "int", FullScreenMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Focus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-setwindowforeground
     */
    SetWindowForeground(Focus) {
        result := ComCall(37, this, "int", Focus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} hwnd 
     * @param {Integer} uMsg 
     * @param {Pointer} wParam 
     * @param {Pointer} lParam 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-notifyownermessage
     */
    NotifyOwnerMessage(hwnd, uMsg, wParam, lParam) {
        result := ComCall(38, this, "ptr", hwnd, "int", uMsg, "ptr", wParam, "ptr", lParam, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Left 
     * @param {Integer} Top 
     * @param {Integer} Width 
     * @param {Integer} Height 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-setwindowposition
     */
    SetWindowPosition(Left, Top, Width, Height) {
        result := ComCall(39, this, "int", Left, "int", Top, "int", Width, "int", Height, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pLeft 
     * @param {Pointer<Integer>} pTop 
     * @param {Pointer<Integer>} pWidth 
     * @param {Pointer<Integer>} pHeight 
     * @returns {HRESULT} 
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
     * 
     * @param {Pointer<Integer>} pWidth 
     * @param {Pointer<Integer>} pHeight 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-getminidealimagesize
     */
    GetMinIdealImageSize(pWidth, pHeight) {
        pWidthMarshal := pWidth is VarRef ? "int*" : "ptr"
        pHeightMarshal := pHeight is VarRef ? "int*" : "ptr"

        result := ComCall(41, this, pWidthMarshal, pWidth, pHeightMarshal, pHeight, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pWidth 
     * @param {Pointer<Integer>} pHeight 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-getmaxidealimagesize
     */
    GetMaxIdealImageSize(pWidth, pHeight) {
        pWidthMarshal := pWidth is VarRef ? "int*" : "ptr"
        pHeightMarshal := pHeight is VarRef ? "int*" : "ptr"

        result := ComCall(42, this, pWidthMarshal, pWidth, pHeightMarshal, pHeight, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pLeft 
     * @param {Pointer<Integer>} pTop 
     * @param {Pointer<Integer>} pWidth 
     * @param {Pointer<Integer>} pHeight 
     * @returns {HRESULT} 
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
     * 
     * @param {Integer} HideCursor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-hidecursor
     */
    HideCursor(HideCursor) {
        result := ComCall(44, this, "int", HideCursor, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-iscursorhidden
     */
    IsCursorHidden() {
        result := ComCall(45, this, "int*", &CursorHidden := 0, "HRESULT")
        return CursorHidden
    }
}
