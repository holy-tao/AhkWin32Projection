#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Graphics\Gdi\HBITMAP.ahk" { HBITMAP }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Graphics\Gdi\LOGFONTW.ahk" { LOGFONTW }
#Import ".\VPWATERMARKFLAGS.ahk" { VPWATERMARKFLAGS }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\COLORREF.ahk" { COLORREF }
#Import ".\VPCOLORFLAGS.ahk" { VPCOLORFLAGS }

/**
 * Exposes methods that set and get visual properties.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-ivisualproperties
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IVisualProperties extends IUnknown {
    /**
     * The interface identifier for IVisualProperties
     * @type {Guid}
     */
    static IID := Guid("{e693cf68-d967-4112-8763-99172aee5e5a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVisualProperties interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetWatermark  : IntPtr
        SetColor      : IntPtr
        GetColor      : IntPtr
        SetItemHeight : IntPtr
        GetItemHeight : IntPtr
        SetFont       : IntPtr
        GetFont       : IntPtr
        SetTheme      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVisualProperties.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Provides a bitmap to use as a watermark.
     * @param {HBITMAP} hbmp Type: <b>HBITMAP</b>
     * 
     * A handle to the bitmap.
     * @param {VPWATERMARKFLAGS} vpwf Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ne-shobjidl-vpwatermarkflags">VPWATERMARKFLAGS</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ne-shobjidl-vpwatermarkflags">VPWATERMARKFLAGS</a> flags that customize the watermark.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ivisualproperties-setwatermark
     */
    SetWatermark(hbmp, vpwf) {
        result := ComCall(3, this, HBITMAP, hbmp, VPWATERMARKFLAGS, vpwf, "HRESULT")
        return result
    }

    /**
     * Sets the color, as specified.
     * @param {VPCOLORFLAGS} vpcf Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ne-shobjidl-vpcolorflags">VPCOLORFLAGS</a></b>
     * 
     * The color flags. See <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ne-shobjidl-vpcolorflags">VPCOLORFLAGS</a>.
     * @param {COLORREF} cr Type: <b><a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a></b>
     * 
     * A value of type <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ivisualproperties-setcolor
     */
    SetColor(vpcf, cr) {
        result := ComCall(4, this, VPCOLORFLAGS, vpcf, COLORREF, cr, "HRESULT")
        return result
    }

    /**
     * Gets the color, as specified.
     * @param {VPCOLORFLAGS} vpcf Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ne-shobjidl-vpcolorflags">VPCOLORFLAGS</a></b>
     * 
     * The color flags. See <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ne-shobjidl-vpcolorflags">VPCOLORFLAGS</a>
     * @returns {COLORREF} Type: <b><a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a>*</b>
     * 
     * A pointer to a value of type <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a>.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ivisualproperties-getcolor
     */
    GetColor(vpcf) {
        result := ComCall(5, this, VPCOLORFLAGS, vpcf, COLORREF.Ptr, &pcr := 0, "HRESULT")
        return pcr
    }

    /**
     * Sets the specified item height.
     * @param {Integer} cyItemInPixels Type: <b>int</b>
     * 
     * The item height, in pixels.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ivisualproperties-setitemheight
     */
    SetItemHeight(cyItemInPixels) {
        result := ComCall(6, this, "int", cyItemInPixels, "HRESULT")
        return result
    }

    /**
     * Gets the item height.
     * @returns {Integer} Type: <b>int*</b>
     * 
     * A pointer to the item height, in pixels.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ivisualproperties-getitemheight
     */
    GetItemHeight() {
        result := ComCall(7, this, "int*", &cyItemInPixels := 0, "HRESULT")
        return cyItemInPixels
    }

    /**
     * Sets attributes of the font.
     * @param {Pointer<LOGFONTW>} plf Type: <b>const LOGFONTW*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/dimm/ns-dimm-logfonta">LOGFONT</a> structure that contains the attributes to set.
     * @param {BOOL} bRedraw Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> if the item should be redrawn after the new attributes are set; otherwise <b>FALSE</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ivisualproperties-setfont
     */
    SetFont(plf, bRedraw) {
        result := ComCall(8, this, LOGFONTW.Ptr, plf, BOOL, bRedraw, "HRESULT")
        return result
    }

    /**
     * Gets the current attributes set on the font.
     * @returns {LOGFONTW} Type: <b>LOGFONTW*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/dimm/ns-dimm-logfonta">LOGFONT</a> structure that, when this method returns successfully, receives the current attributes of the font.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ivisualproperties-getfont
     */
    GetFont() {
        plf := LOGFONTW()
        result := ComCall(9, this, LOGFONTW.Ptr, plf, "HRESULT")
        return plf
    }

    /**
     * Sets the specified theme.
     * @param {PWSTR} pszSubAppName Type: <b>LPCWSTR</b>
     * 
     * A pointer to a Unicode string that contains the application name to use in place of the calling application's name. If this parameter is <b>NULL</b>, the calling application's name is used.
     * @param {PWSTR} pszSubIdList Type: <b>LPCWSTR</b>
     * 
     * A pointer to a Unicode string that contains a semicolon-separated list of CLSID names for use in place of the actual list passed by the window's class. If this parameter is <b>NULL</b>, the ID list from the calling class is used.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ivisualproperties-settheme
     */
    SetTheme(pszSubAppName, pszSubIdList) {
        pszSubAppName := pszSubAppName is String ? StrPtr(pszSubAppName) : pszSubAppName
        pszSubIdList := pszSubIdList is String ? StrPtr(pszSubIdList) : pszSubIdList

        result := ComCall(10, this, "ptr", pszSubAppName, "ptr", pszSubIdList, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVisualProperties.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetWatermark := CallbackCreate(GetMethod(implObj, "SetWatermark"), flags, 3)
        this.vtbl.SetColor := CallbackCreate(GetMethod(implObj, "SetColor"), flags, 3)
        this.vtbl.GetColor := CallbackCreate(GetMethod(implObj, "GetColor"), flags, 3)
        this.vtbl.SetItemHeight := CallbackCreate(GetMethod(implObj, "SetItemHeight"), flags, 2)
        this.vtbl.GetItemHeight := CallbackCreate(GetMethod(implObj, "GetItemHeight"), flags, 2)
        this.vtbl.SetFont := CallbackCreate(GetMethod(implObj, "SetFont"), flags, 3)
        this.vtbl.GetFont := CallbackCreate(GetMethod(implObj, "GetFont"), flags, 2)
        this.vtbl.SetTheme := CallbackCreate(GetMethod(implObj, "SetTheme"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetWatermark)
        CallbackFree(this.vtbl.SetColor)
        CallbackFree(this.vtbl.GetColor)
        CallbackFree(this.vtbl.SetItemHeight)
        CallbackFree(this.vtbl.GetItemHeight)
        CallbackFree(this.vtbl.SetFont)
        CallbackFree(this.vtbl.GetFont)
        CallbackFree(this.vtbl.SetTheme)
    }
}
