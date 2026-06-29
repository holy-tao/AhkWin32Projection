#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IADsDNWithString interface provides methods for an ADSI client to associate a distinguished name (DN) to a string value.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadsdnwithstring
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsDNWithString extends IDispatch {
    /**
     * The interface identifier for IADsDNWithString
     * @type {Guid}
     */
    static IID := Guid("{370df02e-f934-11d2-ba96-00c04fb6d0d1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsDNWithString interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_StringValue : IntPtr
        put_StringValue : IntPtr
        get_DNString    : IntPtr
        put_DNString    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsDNWithString.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    StringValue {
        get => this.get_StringValue()
        set => this.put_StringValue(value)
    }

    /**
     * @type {BSTR} 
     */
    DNString {
        get => this.get_DNString()
        set => this.put_DNString(value)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_StringValue() {
        retval := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrStringValue 
     * @returns {HRESULT} 
     */
    put_StringValue(bstrStringValue) {
        bstrStringValue := bstrStringValue is String ? BSTR.Alloc(bstrStringValue).Value : bstrStringValue

        result := ComCall(8, this, BSTR, bstrStringValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_DNString() {
        retval := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrDNString 
     * @returns {HRESULT} 
     */
    put_DNString(bstrDNString) {
        bstrDNString := bstrDNString is String ? BSTR.Alloc(bstrDNString).Value : bstrDNString

        result := ComCall(10, this, BSTR, bstrDNString, "HRESULT")
        return result
    }

    Query(iid) {
        if (IADsDNWithString.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_StringValue := CallbackCreate(GetMethod(implObj, "get_StringValue"), flags, 2)
        this.vtbl.put_StringValue := CallbackCreate(GetMethod(implObj, "put_StringValue"), flags, 2)
        this.vtbl.get_DNString := CallbackCreate(GetMethod(implObj, "get_DNString"), flags, 2)
        this.vtbl.put_DNString := CallbackCreate(GetMethod(implObj, "put_DNString"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_StringValue)
        CallbackFree(this.vtbl.put_StringValue)
        CallbackFree(this.vtbl.get_DNString)
        CallbackFree(this.vtbl.put_DNString)
    }
}
