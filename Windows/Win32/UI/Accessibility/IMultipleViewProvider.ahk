#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Provides access to controls that provide, and are able to switch between, multiple representations of the same set of information or child controls.
 * @remarks
 * Implemented on a Microsoft UI Automation provider that must support the 
 *             <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingmultipleview">MultipleView</a> control pattern.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-imultipleviewprovider
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IMultipleViewProvider extends IUnknown {
    /**
     * The interface identifier for IMultipleViewProvider
     * @type {Guid}
     */
    static IID := Guid("{6278cab1-b556-4a1a-b4e0-418acc523201}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMultipleViewProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetViewName       : IntPtr
        SetCurrentView    : IntPtr
        get_CurrentView   : IntPtr
        GetSupportedViews : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMultipleViewProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    CurrentView {
        get => this.get_CurrentView()
    }

    /**
     * Retrieves the name of a control-specific view. (IMultipleViewProvider.GetViewName)
     * @remarks
     * View identifiers can be retrieved by using <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-imultipleviewprovider-getsupportedviews">IMultipleViewProvider::GetSupportedViews</a>.
     *             
     * 
     * The collection of view identifiers must be identical for all instances of a control.
     *             
     * 
     * View names must be suitable for use in text-to-speech, Braille, and other accessible applications.
     * @param {Integer} viewId Type: <b>int</b>
     * 
     * A view identifier.
     * @returns {BSTR} Type: <b>BSTR*</b>
     * 
     * Receives a localized name for the view. 
     *                 This parameter is passed uninitialized.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-imultipleviewprovider-getviewname
     */
    GetViewName(viewId) {
        pRetVal := BSTR.Owned()
        result := ComCall(3, this, "int", viewId, BSTR.Ptr, pRetVal, "HRESULT")
        return pRetVal
    }

    /**
     * Sets the current control-specific view.
     * @remarks
     * View identifiers can be retrieved by using <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-imultipleviewprovider-getsupportedviews">IMultipleViewProvider::GetSupportedViews</a>.
     *         
     * 
     * The collection of view identifiers must be identical for all instances of a control.
     * @param {Integer} viewId Type: <b>int</b>
     * 
     * A view identifier.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-imultipleviewprovider-setcurrentview
     */
    SetCurrentView(viewId) {
        result := ComCall(4, this, "int", viewId, "HRESULT")
        return result
    }

    /**
     * Identifies the current view that the control is using to display information or child controls.
     * @remarks
     * The collection of view identifiers must be identical for all instances of a control.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-imultipleviewprovider-get_currentview
     */
    get_CurrentView() {
        result := ComCall(5, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Retrieves a collection of control-specific view identifiers. (IMultipleViewProvider.GetSupportedViews)
     * @remarks
     * An empty array is returned by UIAutoCore.dll if the provider does not supply any view identifiers.
     *         
     * 
     * The collection of view identifiers must be identical for all instances of a control.
     *             
     * 
     * View identifier values can be passed to <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-imultipleviewprovider-getviewname">IMultipleViewProvider::GetViewName</a>.
     * @returns {Pointer<SAFEARRAY>} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
     * 
     * Receives a collection of control-specific integer values that identify the views available for a UI Automation element.
     * 				This parameter is passed uninitialized.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-imultipleviewprovider-getsupportedviews
     */
    GetSupportedViews() {
        result := ComCall(6, this, "ptr*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    Query(iid) {
        if (IMultipleViewProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetViewName := CallbackCreate(GetMethod(implObj, "GetViewName"), flags, 3)
        this.vtbl.SetCurrentView := CallbackCreate(GetMethod(implObj, "SetCurrentView"), flags, 2)
        this.vtbl.get_CurrentView := CallbackCreate(GetMethod(implObj, "get_CurrentView"), flags, 2)
        this.vtbl.GetSupportedViews := CallbackCreate(GetMethod(implObj, "GetSupportedViews"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetViewName)
        CallbackFree(this.vtbl.SetCurrentView)
        CallbackFree(this.vtbl.get_CurrentView)
        CallbackFree(this.vtbl.GetSupportedViews)
    }
}
