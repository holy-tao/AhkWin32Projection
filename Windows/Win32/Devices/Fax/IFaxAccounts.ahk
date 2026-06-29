#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IFaxAccount.ahk" { IFaxAccount }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Represents the collection of fax accounts on the fax server. It provides methods and properties for enumerating the accounts, retrieving a particular account, and reporting the total number of accounts.
 * @remarks
 * A default implementation of <b>IFaxAccounts</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxaccounts">FaxAccounts</a> object. The interface and the object are supported only on Windows Vista or later.
 * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nn-faxcomex-ifaxaccounts
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct IFaxAccounts extends IDispatch {
    /**
     * The interface identifier for IFaxAccounts
     * @type {Guid}
     */
    static IID := Guid("{93ea8162-8be7-42d1-ae7b-ec74e2d989da}")

    /**
     * The class identifier for FaxAccounts
     * @type {Guid}
     */
    static CLSID := Guid("{da1f94aa-ee2c-47c0-8f4f-2a217075b76e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFaxAccounts interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get__NewEnum : IntPtr
        get_Item     : IntPtr
        get_Count    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFaxAccounts.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    /**
     * Returns a FaxAccount object from a FaxAccounts collection.
     * @param {VARIANT} vIndex Type: <b>VARIANT</b>
     * 
     * <b>VARIANT</b> that specifies a value that indicates the item to retrieve from the collection. If this parameter is type <b>VT_I2</b> or <b>VT_I4</b>, it specifies the index of the item to retrieve. The index is 1-based. If this parameter is type <b>VT_BSTR</b>, it specifies the account name to use to search the collection. Other types are not supported.
     * @returns {IFaxAccount} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxcomex/nn-faxcomex-ifaxaccount">IFaxAccount</a>**</b>
     * 
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxaccount">FaxAccount</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccounts-get_item
     */
    get_Item(vIndex) {
        result := ComCall(8, this, VARIANT, vIndex, "ptr*", &pFaxAccount := 0, "HRESULT")
        return IFaxAccount(pFaxAccount)
    }

    /**
     * Holds the number of items in the IFaxAccounts collection.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccounts-get_count
     */
    get_Count() {
        result := ComCall(9, this, "int*", &plCount := 0, "HRESULT")
        return plCount
    }

    Query(iid) {
        if (IFaxAccounts.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
        this.vtbl.get_Item := CallbackCreate(GetMethod(implObj, "get_Item"), flags, 3)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get__NewEnum)
        CallbackFree(this.vtbl.get_Item)
        CallbackFree(this.vtbl.get_Count)
    }
}
