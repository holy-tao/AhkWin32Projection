#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {HBITMAP} hbmp 
     * @param {Integer} vpwf 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ivisualproperties-setwatermark
     */
    SetWatermark(hbmp, vpwf) {
        hbmp := hbmp is Win32Handle ? NumGet(hbmp, "ptr") : hbmp

        result := ComCall(3, this, "ptr", hbmp, "int", vpwf, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} vpcf 
     * @param {COLORREF} cr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ivisualproperties-setcolor
     */
    SetColor(vpcf, cr) {
        result := ComCall(4, this, "int", vpcf, "uint", cr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} vpcf 
     * @param {Pointer<COLORREF>} pcr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ivisualproperties-getcolor
     */
    GetColor(vpcf, pcr) {
        result := ComCall(5, this, "int", vpcf, "ptr", pcr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cyItemInPixels 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ivisualproperties-setitemheight
     */
    SetItemHeight(cyItemInPixels) {
        result := ComCall(6, this, "int", cyItemInPixels, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} cyItemInPixels 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ivisualproperties-getitemheight
     */
    GetItemHeight(cyItemInPixels) {
        cyItemInPixelsMarshal := cyItemInPixels is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, cyItemInPixelsMarshal, cyItemInPixels, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<LOGFONTW>} plf 
     * @param {BOOL} bRedraw 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ivisualproperties-setfont
     */
    SetFont(plf, bRedraw) {
        result := ComCall(8, this, "ptr", plf, "int", bRedraw, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<LOGFONTW>} plf 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ivisualproperties-getfont
     */
    GetFont(plf) {
        result := ComCall(9, this, "ptr", plf, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszSubAppName 
     * @param {PWSTR} pszSubIdList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ivisualproperties-settheme
     */
    SetTheme(pszSubAppName, pszSubIdList) {
        pszSubAppName := pszSubAppName is String ? StrPtr(pszSubAppName) : pszSubAppName
        pszSubIdList := pszSubIdList is String ? StrPtr(pszSubIdList) : pszSubIdList

        result := ComCall(10, this, "ptr", pszSubAppName, "ptr", pszSubIdList, "HRESULT")
        return result
    }
}
