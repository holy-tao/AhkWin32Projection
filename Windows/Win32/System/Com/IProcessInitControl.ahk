#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * The IProcessInitControl (objidlbase.h) interface specifies the process initialization time-out interval.
 * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nn-objidlbase-iprocessinitcontrol
 * @namespace Windows.Win32.System.Com
 */
export default struct IProcessInitControl extends IUnknown {
    /**
     * The interface identifier for IProcessInitControl
     * @type {Guid}
     */
    static IID := Guid("{72380d55-8d2b-43a3-8513-2b6ef31434e9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IProcessInitControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ResetInitializerTimeout : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IProcessInitControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IProcessInitControl::ResetInitializerTimeout (objidlbase.h) method sets the process initialization time-out.
     * @param {Integer} dwSecondsRemaining The number of seconds after this method is called before process initialization times out.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-iprocessinitcontrol-resetinitializertimeout
     */
    ResetInitializerTimeout(dwSecondsRemaining) {
        result := ComCall(3, this, "uint", dwSecondsRemaining, "HRESULT")
        return result
    }

    Query(iid) {
        if (IProcessInitControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ResetInitializerTimeout := CallbackCreate(GetMethod(implObj, "ResetInitializerTimeout"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ResetInitializerTimeout)
    }
}
