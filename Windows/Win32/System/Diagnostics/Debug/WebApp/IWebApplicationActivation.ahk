#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables debugging applications to manage activations.
 * @see https://learn.microsoft.com/windows/win32/api/webapplication/nn-webapplication-iwebapplicationactivation
 * @namespace Windows.Win32.System.Diagnostics.Debug.WebApp
 */
export default struct IWebApplicationActivation extends IUnknown {
    /**
     * The interface identifier for IWebApplicationActivation
     * @type {Guid}
     */
    static IID := Guid("{bcdcd0de-330e-481b-b843-4898a6a8ebac}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWebApplicationActivation interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CancelPendingActivation : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWebApplicationActivation.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Cancels a pending activation.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/webapplication/nf-webapplication-iwebapplicationactivation-cancelpendingactivation
     */
    CancelPendingActivation() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWebApplicationActivation.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CancelPendingActivation := CallbackCreate(GetMethod(implObj, "CancelPendingActivation"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CancelPendingActivation)
    }
}
