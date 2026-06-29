#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\KAGREQDIAG.ahk" { KAGREQDIAG }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct ISQLRequestDiagFields extends IUnknown {
    /**
     * The interface identifier for ISQLRequestDiagFields
     * @type {Guid}
     */
    static IID := Guid("{228972f0-b5ff-11d0-8a80-00c04fd611cd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISQLRequestDiagFields interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RequestDiagFields : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISQLRequestDiagFields.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} cDiagFields 
     * @param {Pointer<KAGREQDIAG>} rgDiagFields 
     * @returns {HRESULT} 
     */
    RequestDiagFields(cDiagFields, rgDiagFields) {
        result := ComCall(3, this, "uint", cDiagFields, KAGREQDIAG.Ptr, rgDiagFields, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISQLRequestDiagFields.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RequestDiagFields := CallbackCreate(GetMethod(implObj, "RequestDiagFields"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RequestDiagFields)
    }
}
