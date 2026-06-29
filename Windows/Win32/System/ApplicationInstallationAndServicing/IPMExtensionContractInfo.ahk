#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct IPMExtensionContractInfo extends IUnknown {
    /**
     * The interface identifier for IPMExtensionContractInfo
     * @type {Guid}
     */
    static IID := Guid("{e5666373-7ba1-467c-b819-b175db1c295b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPMExtensionContractInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_InvocationInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPMExtensionContractInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<BSTR>} pAUMID 
     * @param {Pointer<BSTR>} pArgs 
     * @returns {HRESULT} 
     */
    get_InvocationInfo(pAUMID, pArgs) {
        result := ComCall(3, this, BSTR.Ptr, pAUMID, BSTR.Ptr, pArgs, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPMExtensionContractInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_InvocationInfo := CallbackCreate(GetMethod(implObj, "get_InvocationInfo"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_InvocationInfo)
    }
}
