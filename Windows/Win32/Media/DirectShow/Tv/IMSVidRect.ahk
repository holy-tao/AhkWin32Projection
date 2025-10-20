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
     * 
     * @param {Pointer<Int32>} TopVal 
     * @returns {HRESULT} 
     */
    get_Top(TopVal) {
        result := ComCall(7, this, "int*", TopVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} TopVal 
     * @returns {HRESULT} 
     */
    put_Top(TopVal) {
        result := ComCall(8, this, "int", TopVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} LeftVal 
     * @returns {HRESULT} 
     */
    get_Left(LeftVal) {
        result := ComCall(9, this, "int*", LeftVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} LeftVal 
     * @returns {HRESULT} 
     */
    put_Left(LeftVal) {
        result := ComCall(10, this, "int", LeftVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} WidthVal 
     * @returns {HRESULT} 
     */
    get_Width(WidthVal) {
        result := ComCall(11, this, "int*", WidthVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} WidthVal 
     * @returns {HRESULT} 
     */
    put_Width(WidthVal) {
        result := ComCall(12, this, "int", WidthVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} HeightVal 
     * @returns {HRESULT} 
     */
    get_Height(HeightVal) {
        result := ComCall(13, this, "int*", HeightVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} HeightVal 
     * @returns {HRESULT} 
     */
    put_Height(HeightVal) {
        result := ComCall(14, this, "int", HeightVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} HWndVal 
     * @returns {HRESULT} 
     */
    get_HWnd(HWndVal) {
        result := ComCall(15, this, "ptr", HWndVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} HWndVal 
     * @returns {HRESULT} 
     */
    put_HWnd(HWndVal) {
        HWndVal := HWndVal is Win32Handle ? NumGet(HWndVal, "ptr") : HWndVal

        result := ComCall(16, this, "ptr", HWndVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMSVidRect>} RectVal 
     * @returns {HRESULT} 
     */
    put_Rect(RectVal) {
        result := ComCall(17, this, "ptr", RectVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
