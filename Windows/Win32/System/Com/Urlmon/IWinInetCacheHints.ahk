#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct IWinInetCacheHints extends IUnknown {
    /**
     * The interface identifier for IWinInetCacheHints
     * @type {Guid}
     */
    static IID := Guid("{dd1ec3b3-8391-4fdb-a9e6-347c3caaa7dd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWinInetCacheHints interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetCacheExtension : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWinInetCacheHints.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pwzExt 
     * @param {Pointer<Void>} pszCacheFile 
     * @param {Pointer<Integer>} pcbCacheFile 
     * @param {Pointer<Integer>} pdwWinInetError 
     * @param {Pointer<Integer>} pdwReserved 
     * @returns {HRESULT} 
     */
    SetCacheExtension(pwzExt, pszCacheFile, pcbCacheFile, pdwWinInetError, pdwReserved) {
        pwzExt := pwzExt is String ? StrPtr(pwzExt) : pwzExt

        pszCacheFileMarshal := pszCacheFile is VarRef ? "ptr" : "ptr"
        pcbCacheFileMarshal := pcbCacheFile is VarRef ? "uint*" : "ptr"
        pdwWinInetErrorMarshal := pdwWinInetError is VarRef ? "uint*" : "ptr"
        pdwReservedMarshal := pdwReserved is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pwzExt, pszCacheFileMarshal, pszCacheFile, pcbCacheFileMarshal, pcbCacheFile, pdwWinInetErrorMarshal, pdwWinInetError, pdwReservedMarshal, pdwReserved, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWinInetCacheHints.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetCacheExtension := CallbackCreate(GetMethod(implObj, "SetCacheExtension"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetCacheExtension)
    }
}
