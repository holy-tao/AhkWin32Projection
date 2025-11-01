#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<Integer>} TopVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidrect-get_top
     */
    get_Top(TopVal) {
        TopValMarshal := TopVal is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, TopValMarshal, TopVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} TopVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidrect-put_top
     */
    put_Top(TopVal) {
        result := ComCall(8, this, "int", TopVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} LeftVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidrect-get_left
     */
    get_Left(LeftVal) {
        LeftValMarshal := LeftVal is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, LeftValMarshal, LeftVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} LeftVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidrect-put_left
     */
    put_Left(LeftVal) {
        result := ComCall(10, this, "int", LeftVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} WidthVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidrect-get_width
     */
    get_Width(WidthVal) {
        WidthValMarshal := WidthVal is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, WidthValMarshal, WidthVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} WidthVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidrect-put_width
     */
    put_Width(WidthVal) {
        result := ComCall(12, this, "int", WidthVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} HeightVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidrect-get_height
     */
    get_Height(HeightVal) {
        HeightValMarshal := HeightVal is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, HeightValMarshal, HeightVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} HeightVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidrect-put_height
     */
    put_Height(HeightVal) {
        result := ComCall(14, this, "int", HeightVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} HWndVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidrect-get_hwnd
     */
    get_HWnd(HWndVal) {
        result := ComCall(15, this, "ptr", HWndVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} HWndVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidrect-put_hwnd
     */
    put_HWnd(HWndVal) {
        HWndVal := HWndVal is Win32Handle ? NumGet(HWndVal, "ptr") : HWndVal

        result := ComCall(16, this, "ptr", HWndVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMSVidRect} RectVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidrect-put_rect
     */
    put_Rect(RectVal) {
        result := ComCall(17, this, "ptr", RectVal, "HRESULT")
        return result
    }
}
