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
     * 
     * @param {Integer} viewId 
     * @param {Pointer<BSTR>} pRetVal 
     * @returns {HRESULT} 
     */
    GetViewName(viewId, pRetVal) {
        result := ComCall(3, this, "int", viewId, "ptr", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} viewId 
     * @returns {HRESULT} 
     */
    SetCurrentView(viewId) {
        result := ComCall(4, this, "int", viewId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pRetVal 
     * @returns {HRESULT} 
     */
    get_CurrentView(pRetVal) {
        result := ComCall(5, this, "int*", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} pRetVal 
     * @returns {HRESULT} 
     */
    GetSupportedViews(pRetVal) {
        result := ComCall(6, this, "ptr", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
