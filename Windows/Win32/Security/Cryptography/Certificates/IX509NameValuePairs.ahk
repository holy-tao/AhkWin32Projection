#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IX509NameValuePair.ahk" { IX509NameValuePair }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IX509NameValuePairs interface defines the following methods and properties to manage a collection of IX509NameValuePair objects.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/nn-certenroll-ix509namevaluepairs
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct IX509NameValuePairs extends IDispatch {
    /**
     * The interface identifier for IX509NameValuePairs
     * @type {Guid}
     */
    static IID := Guid("{728ab340-217d-11da-b2a4-000e7bbb2b09}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IX509NameValuePairs interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_ItemByIndex : IntPtr
        get_Count       : IntPtr
        get__NewEnum    : IntPtr
        Add             : IntPtr
        Remove          : IntPtr
        Clear           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IX509NameValuePairs.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * Retrieves an IX509NameValuePair object from the collection by index number.
     * @param {Integer} Index 
     * @returns {IX509NameValuePair} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509namevaluepairs-get_itembyindex
     */
    get_ItemByIndex(Index) {
        result := ComCall(7, this, "int", Index, "ptr*", &pVal := 0, "HRESULT")
        return IX509NameValuePair(pVal)
    }

    /**
     * Retrieves the number of IX509NameValuePair objects in the collection.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509namevaluepairs-get_count
     */
    get_Count() {
        result := ComCall(8, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the enumerator for the collection. (IX509NameValuePairs.get__NewEnum)
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509namevaluepairs-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &pVal := 0, "HRESULT")
        return IUnknown(pVal)
    }

    /**
     * Adds an IX509NameValuePair object to the collection.
     * @param {IX509NameValuePair} pVal A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509namevaluepair">IX509NameValuePair</a> interface that represents the name-value pair to add.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509namevaluepairs-add
     */
    Add(pVal) {
        result := ComCall(10, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * Removes an IX509NameValuePair object from the collection by index number.
     * @param {Integer} Index A <b>LONG</b> variable that contains the index of the object to remove.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509namevaluepairs-remove
     */
    Remove(Index) {
        result := ComCall(11, this, "int", Index, "HRESULT")
        return result
    }

    /**
     * Removes all IX509NameValuePair objects from the collection.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509namevaluepairs-clear
     */
    Clear() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IX509NameValuePairs.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ItemByIndex := CallbackCreate(GetMethod(implObj, "get_ItemByIndex"), flags, 3)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
        this.vtbl.Add := CallbackCreate(GetMethod(implObj, "Add"), flags, 2)
        this.vtbl.Remove := CallbackCreate(GetMethod(implObj, "Remove"), flags, 2)
        this.vtbl.Clear := CallbackCreate(GetMethod(implObj, "Clear"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ItemByIndex)
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.get__NewEnum)
        CallbackFree(this.vtbl.Add)
        CallbackFree(this.vtbl.Remove)
        CallbackFree(this.vtbl.Clear)
    }
}
