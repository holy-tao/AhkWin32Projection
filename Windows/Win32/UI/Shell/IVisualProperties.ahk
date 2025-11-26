#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\Gdi\LOGFONTW.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that set and get visual properties.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-ivisualproperties
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IVisualProperties extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVisualProperties
     * @type {Guid}
     */
    static IID => Guid("{e693cf68-d967-4112-8763-99172aee5e5a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetWatermark", "SetColor", "GetColor", "SetItemHeight", "GetItemHeight", "SetFont", "GetFont", "SetTheme"]

    /**
     * Provides a bitmap to use as a watermark.
     * @param {HBITMAP} hbmp Type: <b>HBITMAP</b>
     * 
     * A handle to the bitmap.
     * @param {Integer} vpwf Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ne-shobjidl-vpwatermarkflags">VPWATERMARKFLAGS</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ne-shobjidl-vpwatermarkflags">VPWATERMARKFLAGS</a> flags that customize the watermark.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-ivisualproperties-setwatermark
     */
    SetWatermark(hbmp, vpwf) {
        hbmp := hbmp is Win32Handle ? NumGet(hbmp, "ptr") : hbmp

        result := ComCall(3, this, "ptr", hbmp, "int", vpwf, "HRESULT")
        return result
    }

    /**
     * Sets the color, as specified.
     * @param {Integer} vpcf Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ne-shobjidl-vpcolorflags">VPCOLORFLAGS</a></b>
     * 
     * The color flags. See <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ne-shobjidl-vpcolorflags">VPCOLORFLAGS</a>.
     * @param {COLORREF} cr Type: <b><a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a></b>
     * 
     * A value of type <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-ivisualproperties-setcolor
     */
    SetColor(vpcf, cr) {
        result := ComCall(4, this, "int", vpcf, "uint", cr, "HRESULT")
        return result
    }

    /**
     * Gets the color, as specified.
     * @param {Integer} vpcf Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ne-shobjidl-vpcolorflags">VPCOLORFLAGS</a></b>
     * 
     * The color flags. See <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ne-shobjidl-vpcolorflags">VPCOLORFLAGS</a>
     * @returns {COLORREF} Type: <b><a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a>*</b>
     * 
     * A pointer to a value of type <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a>.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-ivisualproperties-getcolor
     */
    GetColor(vpcf) {
        result := ComCall(5, this, "int", vpcf, "uint*", &pcr := 0, "HRESULT")
        return pcr
    }

    /**
     * Sets the specified item height.
     * @param {Integer} cyItemInPixels Type: <b>int</b>
     * 
     * The item height, in pixels.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-ivisualproperties-setitemheight
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
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-ivisualproperties-getitemheight
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-ivisualproperties-setfont
     */
    SetFont(plf, bRedraw) {
        result := ComCall(8, this, "ptr", plf, "int", bRedraw, "HRESULT")
        return result
    }

    /**
     * Gets the current attributes set on the font.
     * @returns {LOGFONTW} Type: <b>LOGFONTW*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/dimm/ns-dimm-logfonta">LOGFONT</a> structure that, when this method returns successfully, receives the current attributes of the font.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-ivisualproperties-getfont
     */
    GetFont() {
        plf := LOGFONTW()
        result := ComCall(9, this, "ptr", plf, "HRESULT")
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-ivisualproperties-settheme
     */
    SetTheme(pszSubAppName, pszSubIdList) {
        pszSubAppName := pszSubAppName is String ? StrPtr(pszSubAppName) : pszSubAppName
        pszSubIdList := pszSubIdList is String ? StrPtr(pszSubIdList) : pszSubIdList

        result := ComCall(10, this, "ptr", pszSubAppName, "ptr", pszSubIdList, "HRESULT")
        return result
    }
}
