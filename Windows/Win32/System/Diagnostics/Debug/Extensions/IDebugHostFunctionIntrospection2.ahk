#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDebugHostFunctionLocalDetailsEnumerator.ahk" { IDebugHostFunctionLocalDetailsEnumerator }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDebugHostFunctionIntrospection.ahk" { IDebugHostFunctionIntrospection }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugHostFunctionIntrospection2 extends IDebugHostFunctionIntrospection {
    /**
     * The interface identifier for IDebugHostFunctionIntrospection2
     * @type {Guid}
     */
    static IID := Guid("{8e1cb118-aa83-409a-aae9-c7ff78911a5f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHostFunctionIntrospection2 interfaces
    */
    struct Vtbl extends IDebugHostFunctionIntrospection.Vtbl {
        EnumerateLocalsDetailsEx : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHostFunctionIntrospection2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} enumerateInlinedLocals 
     * @returns {IDebugHostFunctionLocalDetailsEnumerator} 
     */
    EnumerateLocalsDetailsEx(enumerateInlinedLocals) {
        result := ComCall(7, this, "char", enumerateInlinedLocals, "ptr*", &localsEnum := 0, "HRESULT")
        return IDebugHostFunctionLocalDetailsEnumerator(localsEnum)
    }

    Query(iid) {
        if (IDebugHostFunctionIntrospection2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnumerateLocalsDetailsEx := CallbackCreate(GetMethod(implObj, "EnumerateLocalsDetailsEx"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnumerateLocalsDetailsEx)
    }
}
