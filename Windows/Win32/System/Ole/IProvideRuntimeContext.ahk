#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct IProvideRuntimeContext extends IUnknown {
    /**
     * The interface identifier for IProvideRuntimeContext
     * @type {Guid}
     */
    static IID := Guid("{10e2414a-ec59-49d2-bc51-5add2c36febc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IProvideRuntimeContext interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCurrentSourceContext : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IProvideRuntimeContext.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Pointer>} pdwContext 
     * @param {Pointer<VARIANT_BOOL>} pfExecutingGlobalCode 
     * @returns {HRESULT} 
     */
    GetCurrentSourceContext(pdwContext, pfExecutingGlobalCode) {
        pdwContextMarshal := pdwContext is VarRef ? "ptr*" : "ptr"
        pfExecutingGlobalCodeMarshal := pfExecutingGlobalCode is VarRef ? "short*" : "ptr"

        result := ComCall(3, this, pdwContextMarshal, pdwContext, pfExecutingGlobalCodeMarshal, pfExecutingGlobalCode, "HRESULT")
        return result
    }

    Query(iid) {
        if (IProvideRuntimeContext.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCurrentSourceContext := CallbackCreate(GetMethod(implObj, "GetCurrentSourceContext"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCurrentSourceContext)
    }
}
