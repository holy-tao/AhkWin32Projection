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
     * @param {Pointer<BSTR>} strCaption 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-get_caption
     */
    get_Caption(strCaption) {
        result := ComCall(8, this, "ptr", strCaption, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} WindowStyle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-get_windowstyle
     */
    get_WindowStyle(WindowStyle) {
        WindowStyleMarshal := WindowStyle is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, WindowStyleMarshal, WindowStyle, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} WindowStyleEx 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-get_windowstyleex
     */
    get_WindowStyleEx(WindowStyleEx) {
        WindowStyleExMarshal := WindowStyleEx is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, WindowStyleExMarshal, WindowStyleEx, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} AutoShow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-get_autoshow
     */
    get_AutoShow(AutoShow) {
        AutoShowMarshal := AutoShow is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, AutoShowMarshal, AutoShow, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} WindowState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-get_windowstate
     */
    get_WindowState(WindowState) {
        WindowStateMarshal := WindowState is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, WindowStateMarshal, WindowState, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pBackgroundPalette 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-get_backgroundpalette
     */
    get_BackgroundPalette(pBackgroundPalette) {
        pBackgroundPaletteMarshal := pBackgroundPalette is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, pBackgroundPaletteMarshal, pBackgroundPalette, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pVisible 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-get_visible
     */
    get_Visible(pVisible) {
        pVisibleMarshal := pVisible is VarRef ? "int*" : "ptr"

        result := ComCall(20, this, pVisibleMarshal, pVisible, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pLeft 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-get_left
     */
    get_Left(pLeft) {
        pLeftMarshal := pLeft is VarRef ? "int*" : "ptr"

        result := ComCall(22, this, pLeftMarshal, pLeft, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pWidth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-get_width
     */
    get_Width(pWidth) {
        pWidthMarshal := pWidth is VarRef ? "int*" : "ptr"

        result := ComCall(24, this, pWidthMarshal, pWidth, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pTop 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-get_top
     */
    get_Top(pTop) {
        pTopMarshal := pTop is VarRef ? "int*" : "ptr"

        result := ComCall(26, this, pTopMarshal, pTop, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pHeight 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-get_height
     */
    get_Height(pHeight) {
        pHeightMarshal := pHeight is VarRef ? "int*" : "ptr"

        result := ComCall(28, this, pHeightMarshal, pHeight, "HRESULT")
        return result
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
     * @param {Pointer<Pointer>} Owner 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-get_owner
     */
    get_Owner(Owner) {
        OwnerMarshal := Owner is VarRef ? "ptr*" : "ptr"

        result := ComCall(30, this, OwnerMarshal, Owner, "HRESULT")
        return result
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
     * @param {Pointer<Pointer>} Drain 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-get_messagedrain
     */
    get_MessageDrain(Drain) {
        DrainMarshal := Drain is VarRef ? "ptr*" : "ptr"

        result := ComCall(32, this, DrainMarshal, Drain, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Color 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-get_bordercolor
     */
    get_BorderColor(Color) {
        ColorMarshal := Color is VarRef ? "int*" : "ptr"

        result := ComCall(33, this, ColorMarshal, Color, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} FullScreenMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-get_fullscreenmode
     */
    get_FullScreenMode(FullScreenMode) {
        FullScreenModeMarshal := FullScreenMode is VarRef ? "int*" : "ptr"

        result := ComCall(35, this, FullScreenModeMarshal, FullScreenMode, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} CursorHidden 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-ivideowindow-iscursorhidden
     */
    IsCursorHidden(CursorHidden) {
        CursorHiddenMarshal := CursorHidden is VarRef ? "int*" : "ptr"

        result := ComCall(45, this, CursorHiddenMarshal, CursorHidden, "HRESULT")
        return result
    }
}
