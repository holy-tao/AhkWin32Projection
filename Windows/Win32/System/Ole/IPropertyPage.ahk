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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetPageSite", "Activate", "Deactivate", "GetPageInfo", "SetObjects", "Show", "Move", "IsPageDirty", "Apply", "Help", "TranslateAccelerator"]

    /**
     * 
     * @param {IPropertyPageSite} pPageSite 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipropertypage-setpagesite
     */
    SetPageSite(pPageSite) {
        result := ComCall(3, this, "ptr", pPageSite, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hWndParent 
     * @param {Pointer<RECT>} pRect 
     * @param {BOOL} bModal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipropertypage-activate
     */
    Activate(hWndParent, pRect, bModal) {
        hWndParent := hWndParent is Win32Handle ? NumGet(hWndParent, "ptr") : hWndParent

        result := ComCall(4, this, "ptr", hWndParent, "ptr", pRect, "int", bModal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipropertypage-deactivate
     */
    Deactivate() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPPAGEINFO>} pPageInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipropertypage-getpageinfo
     */
    GetPageInfo(pPageInfo) {
        result := ComCall(6, this, "ptr", pPageInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cObjects 
     * @param {Pointer<IUnknown>} ppUnk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipropertypage-setobjects
     */
    SetObjects(cObjects, ppUnk) {
        result := ComCall(7, this, "uint", cObjects, "ptr*", ppUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nCmdShow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipropertypage-show
     */
    Show(nCmdShow) {
        result := ComCall(8, this, "uint", nCmdShow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} pRect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipropertypage-move
     */
    Move(pRect) {
        result := ComCall(9, this, "ptr", pRect, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipropertypage-ispagedirty
     */
    IsPageDirty() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipropertypage-apply
     */
    Apply() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszHelpDir 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipropertypage-help
     */
    Help(pszHelpDir) {
        pszHelpDir := pszHelpDir is String ? StrPtr(pszHelpDir) : pszHelpDir

        result := ComCall(12, this, "ptr", pszHelpDir, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<MSG>} pMsg 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipropertypage-translateaccelerator
     */
    TranslateAccelerator(pMsg) {
        result := ComCall(13, this, "ptr", pMsg, "HRESULT")
        return result
    }
}
