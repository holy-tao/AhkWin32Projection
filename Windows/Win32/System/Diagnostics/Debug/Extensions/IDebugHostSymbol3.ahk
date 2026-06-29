#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\KnownCompiler.ahk" { KnownCompiler }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDebugHostSymbol2.ahk" { IDebugHostSymbol2 }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugHostSymbol3 extends IDebugHostSymbol2 {
    /**
     * The interface identifier for IDebugHostSymbol3
     * @type {Guid}
     */
    static IID := Guid("{1b3fc1b3-d03d-43e0-8eb0-9aa4baa21edb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHostSymbol3 interfaces
    */
    struct Vtbl extends IDebugHostSymbol2.Vtbl {
        GetCompilerInformation : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHostSymbol3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<KnownCompiler>} pCompilerId 
     * @param {Pointer<BSTR>} pCompilerString 
     * @returns {HRESULT} 
     */
    GetCompilerInformation(pCompilerId, pCompilerString) {
        pCompilerIdMarshal := pCompilerId is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, pCompilerIdMarshal, pCompilerId, BSTR.Ptr, pCompilerString, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDebugHostSymbol3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCompilerInformation := CallbackCreate(GetMethod(implObj, "GetCompilerInformation"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCompilerInformation)
    }
}
