#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\UNDOCK_REASON.ahk" { UNDOCK_REASON }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Receives Accessibility Window Docking events.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-iaccessibilitydockingservicecallback
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IAccessibilityDockingServiceCallback extends IUnknown {
    /**
     * The interface identifier for IAccessibilityDockingServiceCallback
     * @type {Guid}
     */
    static IID := Guid("{157733fd-a592-42e5-b594-248468c5a81b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAccessibilityDockingServiceCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Undocked : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAccessibilityDockingServiceCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Undocks the accessibility window so that it will not be automatically moved to its previous location.
     * @param {UNDOCK_REASON} undockReason Specifies the reason why the accessibility application's window was undocked.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-iaccessibilitydockingservicecallback-undocked
     */
    Undocked(undockReason) {
        result := ComCall(3, this, UNDOCK_REASON, undockReason, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAccessibilityDockingServiceCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Undocked := CallbackCreate(GetMethod(implObj, "Undocked"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Undocked)
    }
}
