#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IActiveScriptProfilerControl.ahk" { IActiveScriptProfilerControl }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IActiveScriptProfilerControl2 extends IActiveScriptProfilerControl {
    /**
     * The interface identifier for IActiveScriptProfilerControl2
     * @type {Guid}
     */
    static IID := Guid("{47810165-498f-40be-94f1-653557e9e7da}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IActiveScriptProfilerControl2 interfaces
    */
    struct Vtbl extends IActiveScriptProfilerControl.Vtbl {
        CompleteProfilerStart : IntPtr
        PrepareProfilerStop   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IActiveScriptProfilerControl2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CompleteProfilerStart() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    PrepareProfilerStop() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IActiveScriptProfilerControl2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CompleteProfilerStart := CallbackCreate(GetMethod(implObj, "CompleteProfilerStart"), flags, 1)
        this.vtbl.PrepareProfilerStop := CallbackCreate(GetMethod(implObj, "PrepareProfilerStop"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CompleteProfilerStart)
        CallbackFree(this.vtbl.PrepareProfilerStop)
    }
}
