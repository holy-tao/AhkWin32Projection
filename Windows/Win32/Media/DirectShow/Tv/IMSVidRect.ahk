#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IMSVidRect interface represents a rectangle with an associated window handle.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidRect)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/segment/nn-segment-imsvidrect
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidRect extends IDispatch {
    /**
     * The interface identifier for IMSVidRect
     * @type {Guid}
     */
    static IID := Guid("{7f5000a6-a440-47ca-8acc-c0e75531a2c2}")

    /**
     * The class identifier for MSVidRect
     * @type {Guid}
     */
    static CLSID := Guid("{cb4276e6-7d5f-4cf1-9727-629c5e6db6ae}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidRect interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Top    : IntPtr
        put_Top    : IntPtr
        get_Left   : IntPtr
        put_Left   : IntPtr
        get_Width  : IntPtr
        put_Width  : IntPtr
        get_Height : IntPtr
        put_Height : IntPtr
        get_HWnd   : IntPtr
        put_HWnd   : IntPtr
        put_Rect   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidRect.Vtbl()
        }
        super.__New(implObj, flags)
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
     * @type {IMSVidRect} 
     */
    Rect {
        set => this.put_Rect(value)
    }

    /**
     * The get_Top method retrieves the top y-coordinate of the rectangle. This coordinate is relative to the rectangle's associated window.
     * @returns {Integer} Pointer to a variable that receives the top y-coordinate, in pixels.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidrect-get_top
     */
    get_Top() {
        result := ComCall(7, this, "int*", &TopVal := 0, "HRESULT")
        return TopVal
    }

    /**
     * The put_Top method specifies the top y-coordinate of the rectangle. This coordinate is relative to the rectangle's associated window.
     * @remarks
     * Setting the top y-coordinate also changes the height of the rectangle. For example, if the y-coordinate is zero and the height is 100, setting the y-coordinate to 10 changes the height to 90.
     * @param {Integer} TopVal Specifies the top y-coordinate, in pixels.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidrect-put_top
     */
    put_Top(TopVal) {
        result := ComCall(8, this, "int", TopVal, "HRESULT")
        return result
    }

    /**
     * The get_Left method retrieves the left x-coordinate of the rectangle. This coordinate is relative to the rectangle's associated window.
     * @returns {Integer} Pointer to a variable that receives the left x-coordinate, in pixels.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidrect-get_left
     */
    get_Left() {
        result := ComCall(9, this, "int*", &LeftVal := 0, "HRESULT")
        return LeftVal
    }

    /**
     * The put_Left method specifies the left x-coordinate of the rectangle. This coordinate is relative to the rectangle's associated window.
     * @remarks
     * Setting the left x-coordinate also changes the width of the rectangle. For example, if the x-coordinate is zero and the width is 100, setting the x-coordinate to 10 changes the width to 90.
     * @param {Integer} LeftVal Specifies the left x-coordinate, in pixels.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidrect-put_left
     */
    put_Left(LeftVal) {
        result := ComCall(10, this, "int", LeftVal, "HRESULT")
        return result
    }

    /**
     * The get_Width method retrieves the width of the rectangle.
     * @remarks
     * Calling the <a href="https://docs.microsoft.com/windows/desktop/api/segment/nf-segment-imsvidrect-put_left">IMSVidRect::put_Left</a> method changes the width of the rectangle. For example, if the x-coordinate is zero and the width is 100, setting the x-coordinate to 10 changes the width to 90.
     * @returns {Integer} Pointer to a variable that receives the width, in pixels.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidrect-get_width
     */
    get_Width() {
        result := ComCall(11, this, "int*", &WidthVal := 0, "HRESULT")
        return WidthVal
    }

    /**
     * The put_Width method specifies the width of the rectangle.
     * @param {Integer} WidthVal Specifies the width, in pixels.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidrect-put_width
     */
    put_Width(WidthVal) {
        result := ComCall(12, this, "int", WidthVal, "HRESULT")
        return result
    }

    /**
     * The get_Height method retrieves the height of the rectangle.
     * @remarks
     * Calling the <a href="https://docs.microsoft.com/windows/desktop/api/segment/nf-segment-imsvidrect-put_top">IMSVidRect::put_Top</a> method changes the height of the rectangle. For example, if the y-coordinate is zero and the height is 100, setting the y-coordinate to 10 changes the height to 90.
     * @returns {Integer} Pointer to a variable that receives the height, in pixels.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidrect-get_height
     */
    get_Height() {
        result := ComCall(13, this, "int*", &HeightVal := 0, "HRESULT")
        return HeightVal
    }

    /**
     * The put_Height method specifies the height of the rectangle.
     * @param {Integer} HeightVal Specifies the height, in pixels.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidrect-put_height
     */
    put_Height(HeightVal) {
        result := ComCall(14, this, "int", HeightVal, "HRESULT")
        return result
    }

    /**
     * The get_HWnd method retrieves the window associated with the rectangle.
     * @returns {HWND} Pointer to a variable that receives a handle to the window.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidrect-get_hwnd
     */
    get_HWnd() {
        HWndVal := HWND()
        result := ComCall(15, this, HWND.Ptr, HWndVal, "HRESULT")
        return HWndVal
    }

    /**
     * The put_HWnd method specifies the window associated with the rectangle.
     * @param {HWND} HWndVal Specifies the handle to the window.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidrect-put_hwnd
     */
    put_HWnd(HWndVal) {
        result := ComCall(16, this, HWND, HWndVal, "HRESULT")
        return result
    }

    /**
     * The put_Rect method copies the values of another rectangle to this rectangle.
     * @param {IMSVidRect} RectVal Specifies a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/msvidrect">IMSVidRect</a> interface of the rectangle to copy.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidrect-put_rect
     */
    put_Rect(RectVal) {
        result := ComCall(17, this, "ptr", RectVal, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMSVidRect.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Top := CallbackCreate(GetMethod(implObj, "get_Top"), flags, 2)
        this.vtbl.put_Top := CallbackCreate(GetMethod(implObj, "put_Top"), flags, 2)
        this.vtbl.get_Left := CallbackCreate(GetMethod(implObj, "get_Left"), flags, 2)
        this.vtbl.put_Left := CallbackCreate(GetMethod(implObj, "put_Left"), flags, 2)
        this.vtbl.get_Width := CallbackCreate(GetMethod(implObj, "get_Width"), flags, 2)
        this.vtbl.put_Width := CallbackCreate(GetMethod(implObj, "put_Width"), flags, 2)
        this.vtbl.get_Height := CallbackCreate(GetMethod(implObj, "get_Height"), flags, 2)
        this.vtbl.put_Height := CallbackCreate(GetMethod(implObj, "put_Height"), flags, 2)
        this.vtbl.get_HWnd := CallbackCreate(GetMethod(implObj, "get_HWnd"), flags, 2)
        this.vtbl.put_HWnd := CallbackCreate(GetMethod(implObj, "put_HWnd"), flags, 2)
        this.vtbl.put_Rect := CallbackCreate(GetMethod(implObj, "put_Rect"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Top)
        CallbackFree(this.vtbl.put_Top)
        CallbackFree(this.vtbl.get_Left)
        CallbackFree(this.vtbl.put_Left)
        CallbackFree(this.vtbl.get_Width)
        CallbackFree(this.vtbl.put_Width)
        CallbackFree(this.vtbl.get_Height)
        CallbackFree(this.vtbl.put_Height)
        CallbackFree(this.vtbl.get_HWnd)
        CallbackFree(this.vtbl.put_HWnd)
        CallbackFree(this.vtbl.put_Rect)
    }
}
