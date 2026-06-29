#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct IObjectSafety extends IUnknown {
    /**
     * The interface identifier for IObjectSafety
     * @type {Guid}
     */
    static IID := Guid("{cb5bdc81-93c1-11cf-8f20-00805f2cd064}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IObjectSafety interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetInterfaceSafetyOptions : IntPtr
        SetInterfaceSafetyOptions : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IObjectSafety.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Integer>} pdwSupportedOptions 
     * @param {Pointer<Integer>} pdwEnabledOptions 
     * @returns {HRESULT} 
     */
    GetInterfaceSafetyOptions(riid, pdwSupportedOptions, pdwEnabledOptions) {
        pdwSupportedOptionsMarshal := pdwSupportedOptions is VarRef ? "uint*" : "ptr"
        pdwEnabledOptionsMarshal := pdwEnabledOptions is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, Guid.Ptr, riid, pdwSupportedOptionsMarshal, pdwSupportedOptions, pdwEnabledOptionsMarshal, pdwEnabledOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Integer} dwOptionSetMask 
     * @param {Integer} dwEnabledOptions 
     * @returns {HRESULT} 
     */
    SetInterfaceSafetyOptions(riid, dwOptionSetMask, dwEnabledOptions) {
        result := ComCall(4, this, Guid.Ptr, riid, "uint", dwOptionSetMask, "uint", dwEnabledOptions, "HRESULT")
        return result
    }

    Query(iid) {
        if (IObjectSafety.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetInterfaceSafetyOptions := CallbackCreate(GetMethod(implObj, "GetInterfaceSafetyOptions"), flags, 4)
        this.vtbl.SetInterfaceSafetyOptions := CallbackCreate(GetMethod(implObj, "SetInterfaceSafetyOptions"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetInterfaceSafetyOptions)
        CallbackFree(this.vtbl.SetInterfaceSafetyOptions)
    }
}
