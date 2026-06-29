#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\SCRIPT_ERROR_DEBUG_EXCEPTION_THROWN_KIND.ahk" { SCRIPT_ERROR_DEBUG_EXCEPTION_THROWN_KIND }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IActiveScriptErrorDebug110 extends IUnknown {
    /**
     * The interface identifier for IActiveScriptErrorDebug110
     * @type {Guid}
     */
    static IID := Guid("{516e42b6-89a8-4530-937b-5f0708431442}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IActiveScriptErrorDebug110 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetExceptionThrownKind : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IActiveScriptErrorDebug110.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {SCRIPT_ERROR_DEBUG_EXCEPTION_THROWN_KIND} 
     */
    GetExceptionThrownKind() {
        result := ComCall(3, this, "int*", &pExceptionKind := 0, "HRESULT")
        return pExceptionKind
    }

    Query(iid) {
        if (IActiveScriptErrorDebug110.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetExceptionThrownKind := CallbackCreate(GetMethod(implObj, "GetExceptionThrownKind"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetExceptionThrownKind)
    }
}
