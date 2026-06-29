#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWinInetCacheHints.ahk" { IWinInetCacheHints }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct IWinInetCacheHints2 extends IWinInetCacheHints {
    /**
     * The interface identifier for IWinInetCacheHints2
     * @type {Guid}
     */
    static IID := Guid("{7857aeac-d31f-49bf-884e-dd46df36780a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWinInetCacheHints2 interfaces
    */
    struct Vtbl extends IWinInetCacheHints.Vtbl {
        SetCacheExtension2 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWinInetCacheHints2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pwzExt 
     * @param {PWSTR} pwzCacheFile 
     * @param {Pointer<Integer>} pcchCacheFile 
     * @param {Pointer<Integer>} pdwWinInetError 
     * @param {Pointer<Integer>} pdwReserved 
     * @returns {HRESULT} 
     */
    SetCacheExtension2(pwzExt, pwzCacheFile, pcchCacheFile, pdwWinInetError, pdwReserved) {
        pwzExt := pwzExt is String ? StrPtr(pwzExt) : pwzExt
        pwzCacheFile := pwzCacheFile is String ? StrPtr(pwzCacheFile) : pwzCacheFile

        pcchCacheFileMarshal := pcchCacheFile is VarRef ? "uint*" : "ptr"
        pdwWinInetErrorMarshal := pdwWinInetError is VarRef ? "uint*" : "ptr"
        pdwReservedMarshal := pdwReserved is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pwzExt, "ptr", pwzCacheFile, pcchCacheFileMarshal, pcchCacheFile, pdwWinInetErrorMarshal, pdwWinInetError, pdwReservedMarshal, pdwReserved, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWinInetCacheHints2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetCacheExtension2 := CallbackCreate(GetMethod(implObj, "SetCacheExtension2"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetCacheExtension2)
    }
}
