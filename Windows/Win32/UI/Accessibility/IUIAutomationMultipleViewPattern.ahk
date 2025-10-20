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
     * 
     * @param {Integer} view 
     * @param {Pointer<BSTR>} name 
     * @returns {HRESULT} 
     */
    GetViewName(view, name) {
        result := ComCall(3, this, "int", view, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} view 
     * @returns {HRESULT} 
     */
    SetCurrentView(view) {
        result := ComCall(4, this, "int", view, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentCurrentView(retVal) {
        result := ComCall(5, this, "int*", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} retVal 
     * @returns {HRESULT} 
     */
    GetCurrentSupportedViews(retVal) {
        result := ComCall(6, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedCurrentView(retVal) {
        result := ComCall(7, this, "int*", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} retVal 
     * @returns {HRESULT} 
     */
    GetCachedSupportedViews(retVal) {
        result := ComCall(8, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
