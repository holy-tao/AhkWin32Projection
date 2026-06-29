#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct IActiveXUIHandlerSite2 extends IUnknown {
    /**
     * The interface identifier for IActiveXUIHandlerSite2
     * @type {Guid}
     */
    static IID := Guid("{7e3707b2-d087-4542-ac1f-a0d2fcd080fd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IActiveXUIHandlerSite2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddSuspensionExemption    : IntPtr
        RemoveSuspensionExemption : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IActiveXUIHandlerSite2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    AddSuspensionExemption() {
        result := ComCall(3, this, "uint*", &pullCookie := 0, "HRESULT")
        return pullCookie
    }

    /**
     * 
     * @param {Integer} ullCookie 
     * @returns {HRESULT} 
     */
    RemoveSuspensionExemption(ullCookie) {
        result := ComCall(4, this, "uint", ullCookie, "HRESULT")
        return result
    }

    Query(iid) {
        if (IActiveXUIHandlerSite2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddSuspensionExemption := CallbackCreate(GetMethod(implObj, "AddSuspensionExemption"), flags, 2)
        this.vtbl.RemoveSuspensionExemption := CallbackCreate(GetMethod(implObj, "RemoveSuspensionExemption"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddSuspensionExemption)
        CallbackFree(this.vtbl.RemoveSuspensionExemption)
    }
}
