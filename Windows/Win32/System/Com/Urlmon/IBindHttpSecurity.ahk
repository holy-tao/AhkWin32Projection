#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct IBindHttpSecurity extends IUnknown {
    /**
     * The interface identifier for IBindHttpSecurity
     * @type {Guid}
     */
    static IID := Guid("{a9eda967-f50e-4a33-b358-206f6ef3086d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBindHttpSecurity interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetIgnoreCertMask : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBindHttpSecurity.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetIgnoreCertMask() {
        result := ComCall(3, this, "uint*", &pdwIgnoreCertMask := 0, "HRESULT")
        return pdwIgnoreCertMask
    }

    Query(iid) {
        if (IBindHttpSecurity.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetIgnoreCertMask := CallbackCreate(GetMethod(implObj, "GetIgnoreCertMask"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetIgnoreCertMask)
    }
}
