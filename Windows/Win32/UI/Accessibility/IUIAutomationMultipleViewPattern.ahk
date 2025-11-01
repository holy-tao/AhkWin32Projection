#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to a control that can switch between multiple representations of the same information or set of child controls.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationmultipleviewpattern
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationMultipleViewPattern extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationMultipleViewPattern
     * @type {Guid}
     */
    static IID => Guid("{8d253c91-1dc5-4bb5-b18f-ade16fa495e8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetViewName", "SetCurrentView", "get_CurrentCurrentView", "GetCurrentSupportedViews", "get_CachedCurrentView", "GetCachedSupportedViews"]

    /**
     * 
     * @param {Integer} view 
     * @param {Pointer<BSTR>} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationmultipleviewpattern-getviewname
     */
    GetViewName(view, name) {
        result := ComCall(3, this, "int", view, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} view 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationmultipleviewpattern-setcurrentview
     */
    SetCurrentView(view) {
        result := ComCall(4, this, "int", view, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationmultipleviewpattern-get_currentcurrentview
     */
    get_CurrentCurrentView(retVal) {
        result := ComCall(5, this, "int*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationmultipleviewpattern-getcurrentsupportedviews
     */
    GetCurrentSupportedViews(retVal) {
        result := ComCall(6, this, "ptr*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationmultipleviewpattern-get_cachedcurrentview
     */
    get_CachedCurrentView(retVal) {
        result := ComCall(7, this, "int*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationmultipleviewpattern-getcachedsupportedviews
     */
    GetCachedSupportedViews(retVal) {
        result := ComCall(8, this, "ptr*", retVal, "HRESULT")
        return result
    }
}
