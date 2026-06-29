#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables a debugging or authoring app to receive notification of user interface events and respond to events that require user interaction.
 * @see https://learn.microsoft.com/windows/win32/api/webapplication/nn-webapplication-iwebapplicationuievents
 * @namespace Windows.Win32.System.Diagnostics.Debug.WebApp
 */
export default struct IWebApplicationUIEvents extends IUnknown {
    /**
     * The interface identifier for IWebApplicationUIEvents
     * @type {Guid}
     */
    static IID := Guid("{5b2b3f99-328c-41d5-a6f7-7483ed8e71dd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWebApplicationUIEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SecurityProblem : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWebApplicationUIEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Notifies the authoring app about an authentication problem.
     * @param {Integer} securityProblem Type: <b>DWORD</b>
     * 
     * The security problem encountered.
     * @param {Pointer<HRESULT>} result Type: <b>HRESULT*</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/webapplication/nf-webapplication-iwebapplicationuievents-securityproblem
     */
    SecurityProblem(securityProblem, result) {
        resultMarshal := result is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "uint", securityProblem, resultMarshal, result, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWebApplicationUIEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SecurityProblem := CallbackCreate(GetMethod(implObj, "SecurityProblem"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SecurityProblem)
    }
}
