#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\COMSVCSEVENTINFO.ahk" { COMSVCSEVENTINFO }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Notifies the subscriber when an unhandled exception occurs in the user's code.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-icomexceptionevents
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IComExceptionEvents extends IUnknown {
    /**
     * The interface identifier for IComExceptionEvents
     * @type {Guid}
     */
    static IID := Guid("{683130b3-2e50-11d2-98a5-00c04f8ee1c4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IComExceptionEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnExceptionUser : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IComExceptionEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Generated for transactional components when an unhandled exception occurs in the user's code.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Integer} code The exception code.
     * @param {Integer} _address The address of the exception.
     * @param {PWSTR} pszStackTrace The stack trace.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomexceptionevents-onexceptionuser
     */
    OnExceptionUser(pInfo, code, _address, pszStackTrace) {
        pszStackTrace := pszStackTrace is String ? StrPtr(pszStackTrace) : pszStackTrace

        result := ComCall(3, this, COMSVCSEVENTINFO.Ptr, pInfo, "uint", code, "uint", _address, "ptr", pszStackTrace, "HRESULT")
        return result
    }

    Query(iid) {
        if (IComExceptionEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnExceptionUser := CallbackCreate(GetMethod(implObj, "OnExceptionUser"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnExceptionUser)
    }
}
