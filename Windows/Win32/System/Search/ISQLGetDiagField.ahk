#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\KAGGETDIAG.ahk" { KAGGETDIAG }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct ISQLGetDiagField extends IUnknown {
    /**
     * The interface identifier for ISQLGetDiagField
     * @type {Guid}
     */
    static IID := Guid("{228972f1-b5ff-11d0-8a80-00c04fd611cd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISQLGetDiagField interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDiagField : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISQLGetDiagField.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<KAGGETDIAG>} pDiagInfo 
     * @returns {HRESULT} 
     */
    GetDiagField(pDiagInfo) {
        result := ComCall(3, this, KAGGETDIAG.Ptr, pDiagInfo, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISQLGetDiagField.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDiagField := CallbackCreate(GetMethod(implObj, "GetDiagField"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDiagField)
    }
}
