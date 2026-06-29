#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct IInternetPriority extends IUnknown {
    /**
     * The interface identifier for IInternetPriority
     * @type {Guid}
     */
    static IID := Guid("{79eac9eb-baf9-11ce-8c82-00aa004ba90b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInternetPriority interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetPriority : IntPtr
        GetPriority : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInternetPriority.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} nPriority 
     * @returns {HRESULT} 
     */
    SetPriority(nPriority) {
        result := ComCall(3, this, "int", nPriority, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetPriority() {
        result := ComCall(4, this, "int*", &pnPriority := 0, "HRESULT")
        return pnPriority
    }

    Query(iid) {
        if (IInternetPriority.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetPriority := CallbackCreate(GetMethod(implObj, "SetPriority"), flags, 2)
        this.vtbl.GetPriority := CallbackCreate(GetMethod(implObj, "GetPriority"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetPriority)
        CallbackFree(this.vtbl.GetPriority)
    }
}
