#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to a control that can switch between multiple representations of the same information or set of child controls.
 * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationclient/nn-uiautomationclient-iuiautomationmultipleviewpattern
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
     * @type {Integer} 
     */
    CurrentCurrentView {
        get => this.get_CurrentCurrentView()
    }

    /**
     * @type {Integer} 
     */
    CachedCurrentView {
        get => this.get_CachedCurrentView()
    }

    /**
     * Retrieves the name of a control-specific view. (IUIAutomationMultipleViewPattern.GetViewName)
     * @param {Integer} view_ Type: <b>int</b>
     * 
     * The identifier of the view.
     * @returns {BSTR} Type: <b>BSTR*</b>
     * 
     * Receives a pointer to a localized view name.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationclient/nf-uiautomationclient-iuiautomationmultipleviewpattern-getviewname
     */
    GetViewName(view_) {
        name := BSTR()
        result := ComCall(3, this, "int", view_, "ptr", name, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return name
    }

    /**
     * Sets the view of the control.
     * @param {Integer} view_ Type: <b>int</b>
     * 
     * The control-specific view identifier.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationclient/nf-uiautomationclient-iuiautomationmultipleviewpattern-setcurrentview
     */
    SetCurrentView(view_) {
        result := ComCall(4, this, "int", view_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the control-specific identifier of the current view of the control.
     * @remarks
     * The property values are control-specific.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationclient/nf-uiautomationclient-iuiautomationmultipleviewpattern-get_currentcurrentview
     */
    get_CurrentCurrentView() {
        result := ComCall(5, this, "int*", &retVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retVal
    }

    /**
     * Retrieves a collection of control-specific view identifiers. (IUIAutomationMultipleViewPattern.GetCurrentSupportedViews)
     * @returns {Pointer<SAFEARRAY>} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
     * 
     * Receives a pointer to an array of view identifiers.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationclient/nf-uiautomationclient-iuiautomationmultipleviewpattern-getcurrentsupportedviews
     */
    GetCurrentSupportedViews() {
        result := ComCall(6, this, "ptr*", &retVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retVal
    }

    /**
     * Retrieves the cached control-specific identifier of the current view of the control.
     * @remarks
     * The property values are control-specific.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationclient/nf-uiautomationclient-iuiautomationmultipleviewpattern-get_cachedcurrentview
     */
    get_CachedCurrentView() {
        result := ComCall(7, this, "int*", &retVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retVal
    }

    /**
     * Retrieves a collection of control-specific view identifiers from the cache.
     * @returns {Pointer<SAFEARRAY>} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
     * 
     * Receives a pointer to an array of view identifiers.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationclient/nf-uiautomationclient-iuiautomationmultipleviewpattern-getcachedsupportedviews
     */
    GetCachedSupportedViews() {
        result := ComCall(8, this, "ptr*", &retVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retVal
    }
}
