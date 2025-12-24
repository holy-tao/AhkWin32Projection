#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\HWND.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The IMSVidRect interface represents a rectangle with an associated window handle.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidRect)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidrect
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidRect extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidRect
     * @type {Guid}
     */
    static IID => Guid("{7f5000a6-a440-47ca-8acc-c0e75531a2c2}")

    /**
     * The class identifier for MSVidRect
     * @type {Guid}
     */
    static CLSID => Guid("{cb4276e6-7d5f-4cf1-9727-629c5e6db6ae}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Top", "put_Top", "get_Left", "put_Left", "get_Width", "put_Width", "get_Height", "put_Height", "get_HWnd", "put_HWnd", "put_Rect"]

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
    Height {
        get => this.get_Height()
        set => this.put_Height(value)
    }

    /**
     * @type {HWND} 
     */
    HWnd {
        get => this.get_HWnd()
        set => this.put_HWnd(value)
    }

    /**
     * @type {HRESULT} 
     */
    Rect {
        set => this.put_Rect(value)
    }

    /**
     * The get_Top method retrieves the top y-coordinate of the rectangle. This coordinate is relative to the rectangle's associated window.
     * @returns {Integer} Pointer to a variable that receives the top y-coordinate, in pixels.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidrect-get_top
     */
    get_Top() {
        result := ComCall(7, this, "int*", &TopVal := 0, "HRESULT")
        return TopVal
    }

    /**
     * The put_Top method specifies the top y-coordinate of the rectangle. This coordinate is relative to the rectangle's associated window.
     * @param {Integer} TopVal Specifies the top y-coordinate, in pixels.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidrect-put_top
     */
    put_Top(TopVal) {
        result := ComCall(8, this, "int", TopVal, "HRESULT")
        return result
    }

    /**
     * The get_Left method retrieves the left x-coordinate of the rectangle. This coordinate is relative to the rectangle's associated window.
     * @returns {Integer} Pointer to a variable that receives the left x-coordinate, in pixels.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidrect-get_left
     */
    get_Left() {
        result := ComCall(9, this, "int*", &LeftVal := 0, "HRESULT")
        return LeftVal
    }

    /**
     * The put_Left method specifies the left x-coordinate of the rectangle. This coordinate is relative to the rectangle's associated window.
     * @param {Integer} LeftVal Specifies the left x-coordinate, in pixels.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidrect-put_left
     */
    put_Left(LeftVal) {
        result := ComCall(10, this, "int", LeftVal, "HRESULT")
        return result
    }

    /**
     * The get_Width method retrieves the width of the rectangle.
     * @returns {Integer} Pointer to a variable that receives the width, in pixels.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidrect-get_width
     */
    get_Width() {
        result := ComCall(11, this, "int*", &WidthVal := 0, "HRESULT")
        return WidthVal
    }

    /**
     * The put_Width method specifies the width of the rectangle.
     * @param {Integer} WidthVal Specifies the width, in pixels.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidrect-put_width
     */
    put_Width(WidthVal) {
        result := ComCall(12, this, "int", WidthVal, "HRESULT")
        return result
    }

    /**
     * The get_Height method retrieves the height of the rectangle.
     * @returns {Integer} Pointer to a variable that receives the height, in pixels.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidrect-get_height
     */
    get_Height() {
        result := ComCall(13, this, "int*", &HeightVal := 0, "HRESULT")
        return HeightVal
    }

    /**
     * The put_Height method specifies the height of the rectangle.
     * @param {Integer} HeightVal Specifies the height, in pixels.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidrect-put_height
     */
    put_Height(HeightVal) {
        result := ComCall(14, this, "int", HeightVal, "HRESULT")
        return result
    }

    /**
     * The get_HWnd method retrieves the window associated with the rectangle.
     * @returns {HWND} Pointer to a variable that receives a handle to the window.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidrect-get_hwnd
     */
    get_HWnd() {
        HWndVal := HWND()
        result := ComCall(15, this, "ptr", HWndVal, "HRESULT")
        return HWndVal
    }

    /**
     * The put_HWnd method specifies the window associated with the rectangle.
     * @param {HWND} HWndVal Specifies the handle to the window.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidrect-put_hwnd
     */
    put_HWnd(HWndVal) {
        HWndVal := HWndVal is Win32Handle ? NumGet(HWndVal, "ptr") : HWndVal

        result := ComCall(16, this, "ptr", HWndVal, "HRESULT")
        return result
    }

    /**
     * The put_Rect method copies the values of another rectangle to this rectangle.
     * @param {IMSVidRect} RectVal Specifies a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/msvidrect">IMSVidRect</a> interface of the rectangle to copy.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidrect-put_rect
     */
    put_Rect(RectVal) {
        result := ComCall(17, this, "ptr", RectVal, "HRESULT")
        return result
    }
}
