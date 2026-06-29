#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The IADsFaxNumber interface provides methods for an ADSI client to access the Facsimile Telephone Number attribute.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadsfaxnumber
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsFaxNumber extends IDispatch {
    /**
     * The interface identifier for IADsFaxNumber
     * @type {Guid}
     */
    static IID := Guid("{a910dea9-4680-11d1-a3b4-00c04fb950dc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsFaxNumber interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_TelephoneNumber : IntPtr
        put_TelephoneNumber : IntPtr
        get_Parameters      : IntPtr
        put_Parameters      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsFaxNumber.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    TelephoneNumber {
        get => this.get_TelephoneNumber()
        set => this.put_TelephoneNumber(value)
    }

    /**
     * @type {VARIANT} 
     */
    Parameters {
        get => this.get_Parameters()
        set => this.put_Parameters(value)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_TelephoneNumber() {
        retval := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrTelephoneNumber 
     * @returns {HRESULT} 
     */
    put_TelephoneNumber(bstrTelephoneNumber) {
        bstrTelephoneNumber := bstrTelephoneNumber is String ? BSTR.Alloc(bstrTelephoneNumber).Value : bstrTelephoneNumber

        result := ComCall(8, this, BSTR, bstrTelephoneNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Parameters() {
        retval := VARIANT()
        result := ComCall(9, this, VARIANT.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT} vParameters 
     * @returns {HRESULT} 
     */
    put_Parameters(vParameters) {
        result := ComCall(10, this, VARIANT, vParameters, "HRESULT")
        return result
    }

    Query(iid) {
        if (IADsFaxNumber.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_TelephoneNumber := CallbackCreate(GetMethod(implObj, "get_TelephoneNumber"), flags, 2)
        this.vtbl.put_TelephoneNumber := CallbackCreate(GetMethod(implObj, "put_TelephoneNumber"), flags, 2)
        this.vtbl.get_Parameters := CallbackCreate(GetMethod(implObj, "get_Parameters"), flags, 2)
        this.vtbl.put_Parameters := CallbackCreate(GetMethod(implObj, "put_Parameters"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_TelephoneNumber)
        CallbackFree(this.vtbl.put_TelephoneNumber)
        CallbackFree(this.vtbl.get_Parameters)
        CallbackFree(this.vtbl.put_Parameters)
    }
}
