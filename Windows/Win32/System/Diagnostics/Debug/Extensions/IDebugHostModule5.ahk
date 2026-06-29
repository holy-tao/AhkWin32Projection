#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\KnownCompiler.ahk" { KnownCompiler }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDebugHostModule4.ahk" { IDebugHostModule4 }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugHostModule5 extends IDebugHostModule4 {
    /**
     * The interface identifier for IDebugHostModule5
     * @type {Guid}
     */
    static IID := Guid("{ed36a63d-ad2b-467e-a0ca-4ca949357625}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHostModule5 interfaces
    */
    struct Vtbl extends IDebugHostModule4.Vtbl {
        GetPrimaryCompilerInformation : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHostModule5.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<KnownCompiler>} pCompilerId 
     * @param {Pointer<BSTR>} pPrimaryCompilerString 
     * @returns {HRESULT} 
     */
    GetPrimaryCompilerInformation(pCompilerId, pPrimaryCompilerString) {
        pCompilerIdMarshal := pCompilerId is VarRef ? "int*" : "ptr"

        result := ComCall(19, this, pCompilerIdMarshal, pCompilerId, BSTR.Ptr, pPrimaryCompilerString, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDebugHostModule5.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPrimaryCompilerInformation := CallbackCreate(GetMethod(implObj, "GetPrimaryCompilerInformation"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPrimaryCompilerInformation)
    }
}
