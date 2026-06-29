#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\NavigateDirection.ahk" { NavigateDirection }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRawElementProviderSimple.ahk" { IRawElementProviderSimple }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct ICustomNavigationProvider extends IUnknown {
    /**
     * The interface identifier for ICustomNavigationProvider
     * @type {Guid}
     */
    static IID := Guid("{2062a28a-8c07-4b94-8e12-7037c622aeb8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICustomNavigationProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Navigate : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICustomNavigationProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Note This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The Navigate element specifies a URL used by calls to External.NavigateTaskPaneURL.
     * @param {NavigateDirection} _direction 
     * @returns {IRawElementProviderSimple} 
     * @see https://learn.microsoft.com/windows/win32/WMP/navigate-element
     */
    Navigate(_direction) {
        result := ComCall(3, this, NavigateDirection, _direction, "ptr*", &pRetVal := 0, "HRESULT")
        return IRawElementProviderSimple(pRetVal)
    }

    Query(iid) {
        if (ICustomNavigationProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Navigate := CallbackCreate(GetMethod(implObj, "Navigate"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Navigate)
    }
}
