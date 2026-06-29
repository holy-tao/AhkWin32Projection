#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Gaming
 */
export default struct IXblIdpAuthTokenResult2 extends IUnknown {
    /**
     * The interface identifier for IXblIdpAuthTokenResult2
     * @type {Guid}
     */
    static IID := Guid("{75d760b0-60b9-412d-994f-26b2cd5f7812}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXblIdpAuthTokenResult2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetModernGamertag       : IntPtr
        GetModernGamertagSuffix : IntPtr
        GetUniqueModernGamertag : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXblIdpAuthTokenResult2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    GetModernGamertag() {
        result := ComCall(3, this, PWSTR.Ptr, &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    GetModernGamertagSuffix() {
        result := ComCall(4, this, PWSTR.Ptr, &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    GetUniqueModernGamertag() {
        result := ComCall(5, this, PWSTR.Ptr, &value := 0, "HRESULT")
        return value
    }

    Query(iid) {
        if (IXblIdpAuthTokenResult2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetModernGamertag := CallbackCreate(GetMethod(implObj, "GetModernGamertag"), flags, 2)
        this.vtbl.GetModernGamertagSuffix := CallbackCreate(GetMethod(implObj, "GetModernGamertagSuffix"), flags, 2)
        this.vtbl.GetUniqueModernGamertag := CallbackCreate(GetMethod(implObj, "GetUniqueModernGamertag"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetModernGamertag)
        CallbackFree(this.vtbl.GetModernGamertagSuffix)
        CallbackFree(this.vtbl.GetUniqueModernGamertag)
    }
}
