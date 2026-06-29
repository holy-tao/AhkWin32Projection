#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IADsHold interface provides methods for an ADSI client to access the Hold attribute.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadshold
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsHold extends IDispatch {
    /**
     * The interface identifier for IADsHold
     * @type {Guid}
     */
    static IID := Guid("{b3eb3b37-4080-11d1-a3ac-00c04fb950dc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsHold interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_ObjectName : IntPtr
        put_ObjectName : IntPtr
        get_Amount     : IntPtr
        put_Amount     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsHold.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    ObjectName {
        get => this.get_ObjectName()
        set => this.put_ObjectName(value)
    }

    /**
     * @type {Integer} 
     */
    Amount {
        get => this.get_Amount()
        set => this.put_Amount(value)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ObjectName() {
        retval := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrObjectName 
     * @returns {HRESULT} 
     */
    put_ObjectName(bstrObjectName) {
        bstrObjectName := bstrObjectName is String ? BSTR.Alloc(bstrObjectName).Value : bstrObjectName

        result := ComCall(8, this, BSTR, bstrObjectName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Amount() {
        result := ComCall(9, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} lnAmount 
     * @returns {HRESULT} 
     */
    put_Amount(lnAmount) {
        result := ComCall(10, this, "int", lnAmount, "HRESULT")
        return result
    }

    Query(iid) {
        if (IADsHold.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ObjectName := CallbackCreate(GetMethod(implObj, "get_ObjectName"), flags, 2)
        this.vtbl.put_ObjectName := CallbackCreate(GetMethod(implObj, "put_ObjectName"), flags, 2)
        this.vtbl.get_Amount := CallbackCreate(GetMethod(implObj, "get_Amount"), flags, 2)
        this.vtbl.put_Amount := CallbackCreate(GetMethod(implObj, "put_Amount"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ObjectName)
        CallbackFree(this.vtbl.put_ObjectName)
        CallbackFree(this.vtbl.get_Amount)
        CallbackFree(this.vtbl.put_Amount)
    }
}
