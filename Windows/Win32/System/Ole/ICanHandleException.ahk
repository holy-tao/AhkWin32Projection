#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\EXCEPINFO.ahk" { EXCEPINFO }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct ICanHandleException extends IUnknown {
    /**
     * The interface identifier for ICanHandleException
     * @type {Guid}
     */
    static IID := Guid("{c5598e60-b307-11d1-b27d-006008c3fbfb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICanHandleException interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CanHandleException : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICanHandleException.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<EXCEPINFO>} pExcepInfo 
     * @param {Pointer<VARIANT>} pvar 
     * @returns {HRESULT} 
     */
    CanHandleException(pExcepInfo, pvar) {
        result := ComCall(3, this, EXCEPINFO.Ptr, pExcepInfo, VARIANT.Ptr, pvar, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICanHandleException.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CanHandleException := CallbackCreate(GetMethod(implObj, "CanHandleException"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CanHandleException)
    }
}
