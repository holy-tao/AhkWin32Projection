#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Provides access to a control that can switch between multiple representations of the same information or set of child controls.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationmultipleviewpattern
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationMultipleViewPattern extends IUnknown {
    /**
     * The interface identifier for IUIAutomationMultipleViewPattern
     * @type {Guid}
     */
    static IID := Guid("{8d253c91-1dc5-4bb5-b18f-ade16fa495e8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationMultipleViewPattern interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetViewName              : IntPtr
        SetCurrentView           : IntPtr
        get_CurrentCurrentView   : IntPtr
        GetCurrentSupportedViews : IntPtr
        get_CachedCurrentView    : IntPtr
        GetCachedSupportedViews  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationMultipleViewPattern.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @param {Integer} _view Type: <b>int</b>
     * 
     * The identifier of the view.
     * @returns {BSTR} Type: <b>BSTR*</b>
     * 
     * Receives a pointer to a localized view name.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationmultipleviewpattern-getviewname
     */
    GetViewName(_view) {
        name := BSTR.Owned()
        result := ComCall(3, this, "int", _view, BSTR.Ptr, name, "HRESULT")
        return name
    }

    /**
     * Sets the view of the control.
     * @param {Integer} _view Type: <b>int</b>
     * 
     * The control-specific view identifier.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationmultipleviewpattern-setcurrentview
     */
    SetCurrentView(_view) {
        result := ComCall(4, this, "int", _view, "HRESULT")
        return result
    }

    /**
     * Retrieves the control-specific identifier of the current view of the control.
     * @remarks
     * The property values are control-specific.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationmultipleviewpattern-get_currentcurrentview
     */
    get_CurrentCurrentView() {
        result := ComCall(5, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a collection of control-specific view identifiers. (IUIAutomationMultipleViewPattern.GetCurrentSupportedViews)
     * @returns {Pointer<SAFEARRAY>} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
     * 
     * Receives a pointer to an array of view identifiers.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationmultipleviewpattern-getcurrentsupportedviews
     */
    GetCurrentSupportedViews() {
        result := ComCall(6, this, "ptr*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached control-specific identifier of the current view of the control.
     * @remarks
     * The property values are control-specific.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationmultipleviewpattern-get_cachedcurrentview
     */
    get_CachedCurrentView() {
        result := ComCall(7, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a collection of control-specific view identifiers from the cache.
     * @returns {Pointer<SAFEARRAY>} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
     * 
     * Receives a pointer to an array of view identifiers.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationmultipleviewpattern-getcachedsupportedviews
     */
    GetCachedSupportedViews() {
        result := ComCall(8, this, "ptr*", &retVal := 0, "HRESULT")
        return retVal
    }

    Query(iid) {
        if (IUIAutomationMultipleViewPattern.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetViewName := CallbackCreate(GetMethod(implObj, "GetViewName"), flags, 3)
        this.vtbl.SetCurrentView := CallbackCreate(GetMethod(implObj, "SetCurrentView"), flags, 2)
        this.vtbl.get_CurrentCurrentView := CallbackCreate(GetMethod(implObj, "get_CurrentCurrentView"), flags, 2)
        this.vtbl.GetCurrentSupportedViews := CallbackCreate(GetMethod(implObj, "GetCurrentSupportedViews"), flags, 2)
        this.vtbl.get_CachedCurrentView := CallbackCreate(GetMethod(implObj, "get_CachedCurrentView"), flags, 2)
        this.vtbl.GetCachedSupportedViews := CallbackCreate(GetMethod(implObj, "GetCachedSupportedViews"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetViewName)
        CallbackFree(this.vtbl.SetCurrentView)
        CallbackFree(this.vtbl.get_CurrentCurrentView)
        CallbackFree(this.vtbl.GetCurrentSupportedViews)
        CallbackFree(this.vtbl.get_CachedCurrentView)
        CallbackFree(this.vtbl.GetCachedSupportedViews)
    }
}
