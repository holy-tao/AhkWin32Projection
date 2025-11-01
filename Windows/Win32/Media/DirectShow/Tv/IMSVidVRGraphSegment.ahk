#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IMSVidGraphSegment.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidVRGraphSegment extends IMSVidGraphSegment{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put__VMRendererMode", "put_Owner", "get_Owner", "get_UseOverlay", "put_UseOverlay", "get_Visible", "put_Visible", "get_ColorKey", "put_ColorKey", "get_Source", "put_Source", "get_Destination", "put_Destination", "get_NativeSize", "get_BorderColor", "put_BorderColor", "get_MaintainAspectRatio", "put_MaintainAspectRatio", "Refresh", "DisplayChange", "RePaint"]

    /**
     * 
     * @param {Integer} dwMode 
     * @returns {HRESULT} 
     */
    put__VMRendererMode(dwMode) {
        result := ComCall(19, this, "int", dwMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} Window 
     * @returns {HRESULT} 
     */
    put_Owner(Window) {
        Window := Window is Win32Handle ? NumGet(Window, "ptr") : Window

        result := ComCall(20, this, "ptr", Window, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} Window 
     * @returns {HRESULT} 
     */
    get_Owner(Window) {
        result := ComCall(21, this, "ptr", Window, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} UseOverlayVal 
     * @returns {HRESULT} 
     */
    get_UseOverlay(UseOverlayVal) {
        result := ComCall(22, this, "ptr", UseOverlayVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} UseOverlayVal 
     * @returns {HRESULT} 
     */
    put_UseOverlay(UseOverlayVal) {
        result := ComCall(23, this, "short", UseOverlayVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} Visible 
     * @returns {HRESULT} 
     */
    get_Visible(Visible) {
        result := ComCall(24, this, "ptr", Visible, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Visible 
     * @returns {HRESULT} 
     */
    put_Visible(Visible) {
        result := ComCall(25, this, "short", Visible, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} ColorKey 
     * @returns {HRESULT} 
     */
    get_ColorKey(ColorKey) {
        ColorKeyMarshal := ColorKey is VarRef ? "uint*" : "ptr"

        result := ComCall(26, this, ColorKeyMarshal, ColorKey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ColorKey 
     * @returns {HRESULT} 
     */
    put_ColorKey(ColorKey) {
        result := ComCall(27, this, "uint", ColorKey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} r 
     * @returns {HRESULT} 
     */
    get_Source(r) {
        result := ComCall(28, this, "ptr", r, "HRESULT")
        return result
    }

    /**
     * 
     * @param {RECT} r 
     * @returns {HRESULT} 
     */
    put_Source(r) {
        result := ComCall(29, this, "ptr", r, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} r 
     * @returns {HRESULT} 
     */
    get_Destination(r) {
        result := ComCall(30, this, "ptr", r, "HRESULT")
        return result
    }

    /**
     * 
     * @param {RECT} r 
     * @returns {HRESULT} 
     */
    put_Destination(r) {
        result := ComCall(31, this, "ptr", r, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SIZE>} sizeval 
     * @param {Pointer<SIZE>} aspectratio 
     * @returns {HRESULT} 
     */
    get_NativeSize(sizeval, aspectratio) {
        result := ComCall(32, this, "ptr", sizeval, "ptr", aspectratio, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} color 
     * @returns {HRESULT} 
     */
    get_BorderColor(color) {
        colorMarshal := color is VarRef ? "uint*" : "ptr"

        result := ComCall(33, this, colorMarshal, color, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} color 
     * @returns {HRESULT} 
     */
    put_BorderColor(color) {
        result := ComCall(34, this, "uint", color, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} fMaintain 
     * @returns {HRESULT} 
     */
    get_MaintainAspectRatio(fMaintain) {
        result := ComCall(35, this, "ptr", fMaintain, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fMaintain 
     * @returns {HRESULT} 
     */
    put_MaintainAspectRatio(fMaintain) {
        result := ComCall(36, this, "short", fMaintain, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Refresh() {
        result := ComCall(37, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DisplayChange() {
        result := ComCall(38, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HDC} hdc 
     * @returns {HRESULT} 
     */
    RePaint(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := ComCall(39, this, "ptr", hdc, "HRESULT")
        return result
    }
}
