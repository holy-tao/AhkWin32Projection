#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ICertificationAuthority.ahk" { ICertificationAuthority }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ICertificationAuthorities interface defines the following methods and properties that manage a collection of ICertificationAuthority objects.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/nn-certenroll-icertificationauthorities
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct ICertificationAuthorities extends IDispatch {
    /**
     * The interface identifier for ICertificationAuthorities
     * @type {Guid}
     */
    static IID := Guid("{13b79005-2181-11da-b2a4-000e7bbb2b09}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICertificationAuthorities interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_ItemByIndex  : IntPtr
        get_Count        : IntPtr
        get__NewEnum     : IntPtr
        Add              : IntPtr
        Remove           : IntPtr
        Clear            : IntPtr
        ComputeSiteCosts : IntPtr
        get_ItemByName   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICertificationAuthorities.Vtbl()
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
     * Retrieves an ICertificationAuthority object from the collection by index number.
     * @param {Integer} Index 
     * @returns {ICertificationAuthority} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertificationauthorities-get_itembyindex
     */
    get_ItemByIndex(Index) {
        result := ComCall(7, this, "int", Index, "ptr*", &pVal := 0, "HRESULT")
        return ICertificationAuthority(pVal)
    }

    /**
     * Retrieves the number of ICertificationAuthority objects in the collection.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertificationauthorities-get_count
     */
    get_Count() {
        result := ComCall(8, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the enumerator for the collection. (ICertificationAuthorities.get__NewEnum)
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertificationauthorities-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &pVal := 0, "HRESULT")
        return IUnknown(pVal)
    }

    /**
     * Adds an ICertificationAuthority object to the collection.
     * @param {ICertificationAuthority} pVal Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icertificationauthority">ICertificationAuthority</a> object to add to the collection.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertificationauthorities-add
     */
    Add(pVal) {
        result := ComCall(10, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * Removes an ICertificationAuthority object from the collection by index number.
     * @param {Integer} Index A <b>LONG</b> variable that contains the index of the object to remove.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertificationauthorities-remove
     */
    Remove(Index) {
        result := ComCall(11, this, "int", Index, "HRESULT")
        return result
    }

    /**
     * Removes all ICertificationAuthority objects from the collection.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertificationauthorities-clear
     */
    Clear() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Is not currently used.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertificationauthorities-computesitecosts
     */
    ComputeSiteCosts() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * Retrieves an ICertificationAuthority object from the collection by certification authority name.
     * @param {BSTR} strName 
     * @returns {ICertificationAuthority} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertificationauthorities-get_itembyname
     */
    get_ItemByName(strName) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(14, this, BSTR, strName, "ptr*", &ppValue := 0, "HRESULT")
        return ICertificationAuthority(ppValue)
    }

    Query(iid) {
        if (ICertificationAuthorities.IID.Equals(iid)) {
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
        this.vtbl.ComputeSiteCosts := CallbackCreate(GetMethod(implObj, "ComputeSiteCosts"), flags, 1)
        this.vtbl.get_ItemByName := CallbackCreate(GetMethod(implObj, "get_ItemByName"), flags, 3)
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
        CallbackFree(this.vtbl.ComputeSiteCosts)
        CallbackFree(this.vtbl.get_ItemByName)
    }
}
