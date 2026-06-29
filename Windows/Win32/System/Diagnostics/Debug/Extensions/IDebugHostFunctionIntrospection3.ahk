#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDebugHostFunctionIntrospection2.ahk" { IDebugHostFunctionIntrospection2 }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugHostFunctionIntrospection3 extends IDebugHostFunctionIntrospection2 {
    /**
     * The interface identifier for IDebugHostFunctionIntrospection3
     * @type {Guid}
     */
    static IID := Guid("{a24e286b-891a-40fc-8a3a-89b66eddce57}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHostFunctionIntrospection3 interfaces
    */
    struct Vtbl extends IDebugHostFunctionIntrospection2.Vtbl {
        IsNoReturnFunction : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHostFunctionIntrospection3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    IsNoReturnFunction() {
        result := ComCall(8, this, "int*", &pIsNoReturnFunction := 0, "HRESULT")
        return pIsNoReturnFunction
    }

    Query(iid) {
        if (IDebugHostFunctionIntrospection3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsNoReturnFunction := CallbackCreate(GetMethod(implObj, "IsNoReturnFunction"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsNoReturnFunction)
    }
}
