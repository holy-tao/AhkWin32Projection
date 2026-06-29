#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\BINDINFO.ahk" { BINDINFO }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct IInternetBindInfo extends IUnknown {
    /**
     * The interface identifier for IInternetBindInfo
     * @type {Guid}
     */
    static IID := Guid("{79eac9e1-baf9-11ce-8c82-00aa004ba90b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInternetBindInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetBindInfo   : IntPtr
        GetBindString : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInternetBindInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<BINDINFO>} pbindinfo 
     * @returns {Integer} 
     */
    GetBindInfo(pbindinfo) {
        result := ComCall(3, this, "uint*", &grfBINDF := 0, BINDINFO.Ptr, pbindinfo, "HRESULT")
        return grfBINDF
    }

    /**
     * 
     * @param {Integer} ulStringType 
     * @param {Integer} cEl 
     * @param {Pointer<Integer>} pcElFetched 
     * @returns {PWSTR} 
     */
    GetBindString(ulStringType, cEl, pcElFetched) {
        pcElFetchedMarshal := pcElFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", ulStringType, PWSTR.Ptr, &ppwzStr := 0, "uint", cEl, pcElFetchedMarshal, pcElFetched, "HRESULT")
        return ppwzStr
    }

    Query(iid) {
        if (IInternetBindInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetBindInfo := CallbackCreate(GetMethod(implObj, "GetBindInfo"), flags, 3)
        this.vtbl.GetBindString := CallbackCreate(GetMethod(implObj, "GetBindString"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetBindInfo)
        CallbackFree(this.vtbl.GetBindString)
    }
}
