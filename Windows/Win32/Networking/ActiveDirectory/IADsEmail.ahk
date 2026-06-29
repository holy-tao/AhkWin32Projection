#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IADsEmail interface provides methods for an ADSI client to access the Email Address attribute.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadsemail
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsEmail extends IDispatch {
    /**
     * The interface identifier for IADsEmail
     * @type {Guid}
     */
    static IID := Guid("{97af011a-478e-11d1-a3b4-00c04fb950dc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsEmail interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Type    : IntPtr
        put_Type    : IntPtr
        get_Address : IntPtr
        put_Address : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsEmail.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
        set => this.put_Type(value)
    }

    /**
     * @type {BSTR} 
     */
    Address {
        get => this.get_Address()
        set => this.put_Address(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Type() {
        result := ComCall(7, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} lnType 
     * @returns {HRESULT} 
     */
    put_Type(lnType) {
        result := ComCall(8, this, "int", lnType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Address() {
        retval := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrAddress 
     * @returns {HRESULT} 
     */
    put_Address(bstrAddress) {
        bstrAddress := bstrAddress is String ? BSTR.Alloc(bstrAddress).Value : bstrAddress

        result := ComCall(10, this, BSTR, bstrAddress, "HRESULT")
        return result
    }

    Query(iid) {
        if (IADsEmail.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Type := CallbackCreate(GetMethod(implObj, "get_Type"), flags, 2)
        this.vtbl.put_Type := CallbackCreate(GetMethod(implObj, "put_Type"), flags, 2)
        this.vtbl.get_Address := CallbackCreate(GetMethod(implObj, "get_Address"), flags, 2)
        this.vtbl.put_Address := CallbackCreate(GetMethod(implObj, "put_Address"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Type)
        CallbackFree(this.vtbl.put_Type)
        CallbackFree(this.vtbl.get_Address)
        CallbackFree(this.vtbl.put_Address)
    }
}
