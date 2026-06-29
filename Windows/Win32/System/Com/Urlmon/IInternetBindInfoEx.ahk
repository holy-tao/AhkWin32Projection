#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\BINDINFO.ahk" { BINDINFO }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IInternetBindInfo.ahk" { IInternetBindInfo }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct IInternetBindInfoEx extends IInternetBindInfo {
    /**
     * The interface identifier for IInternetBindInfoEx
     * @type {Guid}
     */
    static IID := Guid("{a3e015b7-a82c-4dcd-a150-569aeeed36ab}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInternetBindInfoEx interfaces
    */
    struct Vtbl extends IInternetBindInfo.Vtbl {
        GetBindInfoEx : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInternetBindInfoEx.Vtbl()
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

        result := ComCall(5, this, grfBINDFMarshal, grfBINDF, BINDINFO.Ptr, pbindinfo, grfBINDF2Marshal, grfBINDF2, pdwReservedMarshal, pdwReserved, "HRESULT")
        return result
    }

    Query(iid) {
        if (IInternetBindInfoEx.IID.Equals(iid)) {
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
