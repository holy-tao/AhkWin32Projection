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
     * 
     * @param {HBITMAP} hbmp 
     * @param {Integer} vpwf 
     * @returns {HRESULT} 
     */
    SetWatermark(hbmp, vpwf) {
        hbmp := hbmp is Win32Handle ? NumGet(hbmp, "ptr") : hbmp

        result := ComCall(3, this, "ptr", hbmp, "int", vpwf, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} vpcf 
     * @param {COLORREF} cr 
     * @returns {HRESULT} 
     */
    SetColor(vpcf, cr) {
        result := ComCall(4, this, "int", vpcf, "uint", cr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} vpcf 
     * @param {Pointer<COLORREF>} pcr 
     * @returns {HRESULT} 
     */
    GetColor(vpcf, pcr) {
        result := ComCall(5, this, "int", vpcf, "ptr", pcr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cyItemInPixels 
     * @returns {HRESULT} 
     */
    SetItemHeight(cyItemInPixels) {
        result := ComCall(6, this, "int", cyItemInPixels, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} cyItemInPixels 
     * @returns {HRESULT} 
     */
    GetItemHeight(cyItemInPixels) {
        result := ComCall(7, this, "int*", cyItemInPixels, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<LOGFONTW>} plf 
     * @param {BOOL} bRedraw 
     * @returns {HRESULT} 
     */
    SetFont(plf, bRedraw) {
        result := ComCall(8, this, "ptr", plf, "int", bRedraw, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<LOGFONTW>} plf 
     * @returns {HRESULT} 
     */
    GetFont(plf) {
        result := ComCall(9, this, "ptr", plf, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszSubAppName 
     * @param {PWSTR} pszSubIdList 
     * @returns {HRESULT} 
     */
    SetTheme(pszSubAppName, pszSubIdList) {
        pszSubAppName := pszSubAppName is String ? StrPtr(pszSubAppName) : pszSubAppName
        pszSubIdList := pszSubIdList is String ? StrPtr(pszSubIdList) : pszSubIdList

        result := ComCall(10, this, "ptr", pszSubAppName, "ptr", pszSubIdList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
