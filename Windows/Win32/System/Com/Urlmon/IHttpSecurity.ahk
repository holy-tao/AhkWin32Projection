#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWindowForBindingUI.ahk" { IWindowForBindingUI }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct IHttpSecurity extends IWindowForBindingUI {
    /**
     * The interface identifier for IHttpSecurity
     * @type {Guid}
     */
    static IID := Guid("{79eac9d7-bafa-11ce-8c82-00aa004ba90b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHttpSecurity interfaces
    */
    struct Vtbl extends IWindowForBindingUI.Vtbl {
        OnSecurityProblem : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHttpSecurity.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwProblem 
     * @returns {HRESULT} 
     */
    OnSecurityProblem(dwProblem) {
        result := ComCall(4, this, "uint", dwProblem, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHttpSecurity.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnSecurityProblem := CallbackCreate(GetMethod(implObj, "OnSecurityProblem"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnSecurityProblem)
    }
}
