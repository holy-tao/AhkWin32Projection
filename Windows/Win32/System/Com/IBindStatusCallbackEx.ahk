#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\BINDINFO.ahk" { BINDINFO }
#Import ".\IBindStatusCallback.ahk" { IBindStatusCallback }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct IBindStatusCallbackEx extends IBindStatusCallback {
    /**
     * The interface identifier for IBindStatusCallbackEx
     * @type {Guid}
     */
    static IID := Guid("{aaa74ef9-8ee7-4659-88d9-f8c504da73cc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBindStatusCallbackEx interfaces
    */
    struct Vtbl extends IBindStatusCallback.Vtbl {
        GetBindInfoEx : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBindStatusCallbackEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Integer>} grfBINDF 
     * @param {Pointer<BINDINFO>} pbindinfo 
     * @param {Pointer<Integer>} grfBINDF2 
     * @param {Pointer<Integer>} pdwReserved 
     * @returns {HRESULT} 
     */
    GetBindInfoEx(grfBINDF, pbindinfo, grfBINDF2, pdwReserved) {
        grfBINDFMarshal := grfBINDF is VarRef ? "uint*" : "ptr"
        grfBINDF2Marshal := grfBINDF2 is VarRef ? "uint*" : "ptr"
        pdwReservedMarshal := pdwReserved is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, grfBINDFMarshal, grfBINDF, BINDINFO.Ptr, pbindinfo, grfBINDF2Marshal, grfBINDF2, pdwReservedMarshal, pdwReserved, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBindStatusCallbackEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetBindInfoEx := CallbackCreate(GetMethod(implObj, "GetBindInfoEx"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetBindInfoEx)
    }
}
