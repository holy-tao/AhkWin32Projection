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
     * 
     * @param {BSTR} strCaption 
     * @returns {HRESULT} 
     */
    put_Caption(strCaption) {
        strCaption := strCaption is String ? BSTR.Alloc(strCaption).Value : strCaption

        result := ComCall(7, this, "ptr", strCaption, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strCaption 
     * @returns {HRESULT} 
     */
    get_Caption(strCaption) {
        result := ComCall(8, this, "ptr", strCaption, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} WindowStyle 
     * @returns {HRESULT} 
     */
    put_WindowStyle(WindowStyle) {
        result := ComCall(9, this, "int", WindowStyle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} WindowStyle 
     * @returns {HRESULT} 
     */
    get_WindowStyle(WindowStyle) {
        result := ComCall(10, this, "int*", WindowStyle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} WindowStyleEx 
     * @returns {HRESULT} 
     */
    put_WindowStyleEx(WindowStyleEx) {
        result := ComCall(11, this, "int", WindowStyleEx, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} WindowStyleEx 
     * @returns {HRESULT} 
     */
    get_WindowStyleEx(WindowStyleEx) {
        result := ComCall(12, this, "int*", WindowStyleEx, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} AutoShow 
     * @returns {HRESULT} 
     */
    put_AutoShow(AutoShow) {
        result := ComCall(13, this, "int", AutoShow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} AutoShow 
     * @returns {HRESULT} 
     */
    get_AutoShow(AutoShow) {
        result := ComCall(14, this, "int*", AutoShow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} WindowState 
     * @returns {HRESULT} 
     */
    put_WindowState(WindowState) {
        result := ComCall(15, this, "int", WindowState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} WindowState 
     * @returns {HRESULT} 
     */
    get_WindowState(WindowState) {
        result := ComCall(16, this, "int*", WindowState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} BackgroundPalette 
     * @returns {HRESULT} 
     */
    put_BackgroundPalette(BackgroundPalette) {
        result := ComCall(17, this, "int", BackgroundPalette, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pBackgroundPalette 
     * @returns {HRESULT} 
     */
    get_BackgroundPalette(pBackgroundPalette) {
        result := ComCall(18, this, "int*", pBackgroundPalette, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Visible 
     * @returns {HRESULT} 
     */
    put_Visible(Visible) {
        result := ComCall(19, this, "int", Visible, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVisible 
     * @returns {HRESULT} 
     */
    get_Visible(pVisible) {
        result := ComCall(20, this, "int*", pVisible, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Left 
     * @returns {HRESULT} 
     */
    put_Left(Left) {
        result := ComCall(21, this, "int", Left, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pLeft 
     * @returns {HRESULT} 
     */
    get_Left(pLeft) {
        result := ComCall(22, this, "int*", pLeft, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Width 
     * @returns {HRESULT} 
     */
    put_Width(Width) {
        result := ComCall(23, this, "int", Width, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pWidth 
     * @returns {HRESULT} 
     */
    get_Width(pWidth) {
        result := ComCall(24, this, "int*", pWidth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Top 
     * @returns {HRESULT} 
     */
    put_Top(Top) {
        result := ComCall(25, this, "int", Top, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pTop 
     * @returns {HRESULT} 
     */
    get_Top(pTop) {
        result := ComCall(26, this, "int*", pTop, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Height 
     * @returns {HRESULT} 
     */
    put_Height(Height) {
        result := ComCall(27, this, "int", Height, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pHeight 
     * @returns {HRESULT} 
     */
    get_Height(pHeight) {
        result := ComCall(28, this, "int*", pHeight, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} Owner 
     * @returns {HRESULT} 
     */
    put_Owner(Owner) {
        result := ComCall(29, this, "ptr", Owner, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IntPtr>} Owner 
     * @returns {HRESULT} 
     */
    get_Owner(Owner) {
        result := ComCall(30, this, "ptr*", Owner, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} Drain 
     * @returns {HRESULT} 
     */
    put_MessageDrain(Drain) {
        result := ComCall(31, this, "ptr", Drain, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IntPtr>} Drain 
     * @returns {HRESULT} 
     */
    get_MessageDrain(Drain) {
        result := ComCall(32, this, "ptr*", Drain, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Color 
     * @returns {HRESULT} 
     */
    get_BorderColor(Color) {
        result := ComCall(33, this, "int*", Color, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Color 
     * @returns {HRESULT} 
     */
    put_BorderColor(Color) {
        result := ComCall(34, this, "int", Color, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} FullScreenMode 
     * @returns {HRESULT} 
     */
    get_FullScreenMode(FullScreenMode) {
        result := ComCall(35, this, "int*", FullScreenMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} FullScreenMode 
     * @returns {HRESULT} 
     */
    put_FullScreenMode(FullScreenMode) {
        result := ComCall(36, this, "int", FullScreenMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Focus 
     * @returns {HRESULT} 
     */
    SetWindowForeground(Focus) {
        result := ComCall(37, this, "int", Focus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} hwnd 
     * @param {Integer} uMsg 
     * @param {Pointer} wParam 
     * @param {Pointer} lParam 
     * @returns {HRESULT} 
     */
    NotifyOwnerMessage(hwnd, uMsg, wParam, lParam) {
        result := ComCall(38, this, "ptr", hwnd, "int", uMsg, "ptr", wParam, "ptr", lParam, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Left 
     * @param {Integer} Top 
     * @param {Integer} Width 
     * @param {Integer} Height 
     * @returns {HRESULT} 
     */
    SetWindowPosition(Left, Top, Width, Height) {
        result := ComCall(39, this, "int", Left, "int", Top, "int", Width, "int", Height, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pLeft 
     * @param {Pointer<Int32>} pTop 
     * @param {Pointer<Int32>} pWidth 
     * @param {Pointer<Int32>} pHeight 
     * @returns {HRESULT} 
     */
    GetWindowPosition(pLeft, pTop, pWidth, pHeight) {
        result := ComCall(40, this, "int*", pLeft, "int*", pTop, "int*", pWidth, "int*", pHeight, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pWidth 
     * @param {Pointer<Int32>} pHeight 
     * @returns {HRESULT} 
     */
    GetMinIdealImageSize(pWidth, pHeight) {
        result := ComCall(41, this, "int*", pWidth, "int*", pHeight, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pWidth 
     * @param {Pointer<Int32>} pHeight 
     * @returns {HRESULT} 
     */
    GetMaxIdealImageSize(pWidth, pHeight) {
        result := ComCall(42, this, "int*", pWidth, "int*", pHeight, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pLeft 
     * @param {Pointer<Int32>} pTop 
     * @param {Pointer<Int32>} pWidth 
     * @param {Pointer<Int32>} pHeight 
     * @returns {HRESULT} 
     */
    GetRestorePosition(pLeft, pTop, pWidth, pHeight) {
        result := ComCall(43, this, "int*", pLeft, "int*", pTop, "int*", pWidth, "int*", pHeight, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} HideCursor 
     * @returns {HRESULT} 
     */
    HideCursor(HideCursor) {
        result := ComCall(44, this, "int", HideCursor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} CursorHidden 
     * @returns {HRESULT} 
     */
    IsCursorHidden(CursorHidden) {
        result := ComCall(45, this, "int*", CursorHidden, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
