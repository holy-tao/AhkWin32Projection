#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRawElementProviderSimple.ahk" { IRawElementProviderSimple }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes a method that enables repositioning of window-based elements within the fragment's UI Automation tree.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-irawelementproviderhwndoverride
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IRawElementProviderHwndOverride extends IUnknown {
    /**
     * The interface identifier for IRawElementProviderHwndOverride
     * @type {Guid}
     */
    static IID := Guid("{1d5df27c-8947-4425-b8d9-79787bb460b8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRawElementProviderHwndOverride interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetOverrideProviderForHwnd : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRawElementProviderHwndOverride.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a UI Automation provider for the specified element.
     * @remarks
     * This method is implemented by fragment roots that contain window-based child elements. 
     * 			By default, controls hosted in windows are served by default providers in addition to any custom providers. 
     * 			The default providers treat all windows within a parent window as siblings. If you want to restructure the UI Automation 
     * 			tree so that one window-based control is seen as a child of another, you must override the default provider by implementing 
     * 			this method on the fragment root. The returned provider can supply additional properties or override properties of the 
     * 			specified component.
     * 
     * The returned provider must be part of the fragment tree. It can supply additional properties or 
     * 			override properties of the specified component.
     * 
     * If the returned provider implements <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementproviderfragment">IRawElementProviderFragment</a>, 
     * 			the provider should be part of the fragment's tree and be reachable by navigating from the fragment's root.
     * @param {HWND} _hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * The window handle of the element.
     * @returns {IRawElementProviderSimple} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a>**</b>
     * 
     * Receives a pointer to the new provider for the specified window, or <b>NULL</b> if the provider is not being overridden. 
     * 				This parameter is passed uninitialized.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-irawelementproviderhwndoverride-getoverrideproviderforhwnd
     */
    GetOverrideProviderForHwnd(_hwnd) {
        result := ComCall(3, this, HWND, _hwnd, "ptr*", &pRetVal := 0, "HRESULT")
        return IRawElementProviderSimple(pRetVal)
    }

    Query(iid) {
        if (IRawElementProviderHwndOverride.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetOverrideProviderForHwnd := CallbackCreate(GetMethod(implObj, "GetOverrideProviderForHwnd"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetOverrideProviderForHwnd)
    }
}
