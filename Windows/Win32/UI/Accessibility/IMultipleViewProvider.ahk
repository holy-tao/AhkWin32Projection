#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to controls that provide, and are able to switch between, multiple representations of the same set of information or child controls.
 * @remarks
 * 
  * Implemented on a Microsoft UI Automation provider that must support the 
  *             <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingmultipleview">MultipleView</a> control pattern.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-imultipleviewprovider
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IMultipleViewProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMultipleViewProvider
     * @type {Guid}
     */
    static IID => Guid("{6278cab1-b556-4a1a-b4e0-418acc523201}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetViewName", "SetCurrentView", "get_CurrentView", "GetSupportedViews"]

    /**
     * 
     * @param {Integer} viewId 
     * @param {Pointer<BSTR>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-imultipleviewprovider-getviewname
     */
    GetViewName(viewId, pRetVal) {
        result := ComCall(3, this, "int", viewId, "ptr", pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} viewId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-imultipleviewprovider-setcurrentview
     */
    SetCurrentView(viewId) {
        result := ComCall(4, this, "int", viewId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-imultipleviewprovider-get_currentview
     */
    get_CurrentView(pRetVal) {
        pRetValMarshal := pRetVal is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, pRetValMarshal, pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-imultipleviewprovider-getsupportedviews
     */
    GetSupportedViews(pRetVal) {
        pRetValMarshal := pRetVal is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, pRetValMarshal, pRetVal, "HRESULT")
        return result
    }
}
