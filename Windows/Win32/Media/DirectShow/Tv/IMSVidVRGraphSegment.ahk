#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IMSVidGraphSegment.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidVRGraphSegment extends IMSVidGraphSegment{
    /**
     * The interface identifier for IMSVidVRGraphSegment
     * @type {Guid}
     */
    static IID => Guid("{dd47de3f-9874-4f7b-8b22-7cb2688461e7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 19

    /**
     * 
     * @param {Integer} dwMode 
     * @returns {HRESULT} 
     */
    put__VMRendererMode(dwMode) {
        result := ComCall(19, this, "int", dwMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} Window 
     * @returns {HRESULT} 
     */
    put_Owner(Window) {
        Window := Window is Win32Handle ? NumGet(Window, "ptr") : Window

        result := ComCall(20, this, "ptr", Window, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} Window 
     * @returns {HRESULT} 
     */
    get_Owner(Window) {
        result := ComCall(21, this, "ptr", Window, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} UseOverlayVal 
     * @returns {HRESULT} 
     */
    get_UseOverlay(UseOverlayVal) {
        result := ComCall(22, this, "ptr", UseOverlayVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} UseOverlayVal 
     * @returns {HRESULT} 
     */
    put_UseOverlay(UseOverlayVal) {
        result := ComCall(23, this, "short", UseOverlayVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} Visible 
     * @returns {HRESULT} 
     */
    get_Visible(Visible) {
        result := ComCall(24, this, "ptr", Visible, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Visible 
     * @returns {HRESULT} 
     */
    put_Visible(Visible) {
        result := ComCall(25, this, "short", Visible, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} ColorKey 
     * @returns {HRESULT} 
     */
    get_ColorKey(ColorKey) {
        result := ComCall(26, this, "uint*", ColorKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ColorKey 
     * @returns {HRESULT} 
     */
    put_ColorKey(ColorKey) {
        result := ComCall(27, this, "uint", ColorKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} r 
     * @returns {HRESULT} 
     */
    get_Source(r) {
        result := ComCall(28, this, "ptr", r, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {RECT} r 
     * @returns {HRESULT} 
     */
    put_Source(r) {
        result := ComCall(29, this, "ptr", r, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} r 
     * @returns {HRESULT} 
     */
    get_Destination(r) {
        result := ComCall(30, this, "ptr", r, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {RECT} r 
     * @returns {HRESULT} 
     */
    put_Destination(r) {
        result := ComCall(31, this, "ptr", r, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SIZE>} sizeval 
     * @param {Pointer<SIZE>} aspectratio 
     * @returns {HRESULT} 
     */
    get_NativeSize(sizeval, aspectratio) {
        result := ComCall(32, this, "ptr", sizeval, "ptr", aspectratio, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} color 
     * @returns {HRESULT} 
     */
    get_BorderColor(color) {
        result := ComCall(33, this, "uint*", color, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} color 
     * @returns {HRESULT} 
     */
    put_BorderColor(color) {
        result := ComCall(34, this, "uint", color, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} fMaintain 
     * @returns {HRESULT} 
     */
    get_MaintainAspectRatio(fMaintain) {
        result := ComCall(35, this, "ptr", fMaintain, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fMaintain 
     * @returns {HRESULT} 
     */
    put_MaintainAspectRatio(fMaintain) {
        result := ComCall(36, this, "short", fMaintain, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Refresh() {
        result := ComCall(37, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DisplayChange() {
        result := ComCall(38, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HDC} hdc 
     * @returns {HRESULT} 
     */
    RePaint(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := ComCall(39, this, "ptr", hdc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
