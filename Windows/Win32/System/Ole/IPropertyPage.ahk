#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides the main features of a property page object that manages a particular page within a property sheet.
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/nn-ocidl-ipropertypage
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IPropertyPage extends IUnknown{
    /**
     * The interface identifier for IPropertyPage
     * @type {Guid}
     */
    static IID => Guid("{b196b28d-bab4-101a-b69c-00aa00341d07}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IPropertyPageSite>} pPageSite 
     * @returns {HRESULT} 
     */
    SetPageSite(pPageSite) {
        result := ComCall(3, this, "ptr", pPageSite, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hWndParent 
     * @param {Pointer<RECT>} pRect 
     * @param {BOOL} bModal 
     * @returns {HRESULT} 
     */
    Activate(hWndParent, pRect, bModal) {
        hWndParent := hWndParent is Win32Handle ? NumGet(hWndParent, "ptr") : hWndParent

        result := ComCall(4, this, "ptr", hWndParent, "ptr", pRect, "int", bModal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Deactivate() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPPAGEINFO>} pPageInfo 
     * @returns {HRESULT} 
     */
    GetPageInfo(pPageInfo) {
        result := ComCall(6, this, "ptr", pPageInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cObjects 
     * @param {Pointer<IUnknown>} ppUnk 
     * @returns {HRESULT} 
     */
    SetObjects(cObjects, ppUnk) {
        result := ComCall(7, this, "uint", cObjects, "ptr", ppUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nCmdShow 
     * @returns {HRESULT} 
     */
    Show(nCmdShow) {
        result := ComCall(8, this, "uint", nCmdShow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} pRect 
     * @returns {HRESULT} 
     */
    Move(pRect) {
        result := ComCall(9, this, "ptr", pRect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsPageDirty() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Apply() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszHelpDir 
     * @returns {HRESULT} 
     */
    Help(pszHelpDir) {
        pszHelpDir := pszHelpDir is String ? StrPtr(pszHelpDir) : pszHelpDir

        result := ComCall(12, this, "ptr", pszHelpDir, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<MSG>} pMsg 
     * @returns {HRESULT} 
     */
    TranslateAccelerator(pMsg) {
        result := ComCall(13, this, "ptr", pMsg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
