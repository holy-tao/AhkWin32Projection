#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IDebugCookie extends IUnknown {
    /**
     * The interface identifier for IDebugCookie
     * @type {Guid}
     */
    static IID := Guid("{51973c39-cb0c-11d0-b5c9-00a0244a0e7a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugCookie interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetDebugCookie : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugCookie.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwDebugAppCookie 
     * @returns {HRESULT} 
     */
    SetDebugCookie(dwDebugAppCookie) {
        result := ComCall(3, this, "uint", dwDebugAppCookie, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDebugCookie.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetDebugCookie := CallbackCreate(GetMethod(implObj, "SetDebugCookie"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetDebugCookie)
    }
}
