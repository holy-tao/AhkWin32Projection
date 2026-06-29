#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IPrivateUnknown extends IUnknown {
    /**
     * The interface identifier for IPrivateUnknown
     * @type {Guid}
     */
    static IID := Guid("{89126bab-6ead-11d1-8c18-00c04fd8d503}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrivateUnknown interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ADSIInitializeObject : IntPtr
        ADSIReleaseObject    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrivateUnknown.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} lpszUserName 
     * @param {BSTR} lpszPassword 
     * @param {Integer} lnReserved 
     * @returns {HRESULT} 
     */
    ADSIInitializeObject(lpszUserName, lpszPassword, lnReserved) {
        lpszUserName := lpszUserName is String ? BSTR.Alloc(lpszUserName).Value : lpszUserName
        lpszPassword := lpszPassword is String ? BSTR.Alloc(lpszPassword).Value : lpszPassword

        result := ComCall(3, this, BSTR, lpszUserName, BSTR, lpszPassword, "int", lnReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ADSIReleaseObject() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPrivateUnknown.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ADSIInitializeObject := CallbackCreate(GetMethod(implObj, "ADSIInitializeObject"), flags, 4)
        this.vtbl.ADSIReleaseObject := CallbackCreate(GetMethod(implObj, "ADSIReleaseObject"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ADSIInitializeObject)
        CallbackFree(this.vtbl.ADSIReleaseObject)
    }
}
