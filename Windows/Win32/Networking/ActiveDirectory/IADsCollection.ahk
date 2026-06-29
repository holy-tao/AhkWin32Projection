#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The IADsCollection interface is a dual interface that enables its hosting ADSI object to define and manage an arbitrary set of named data elements for a directory service.
 * @remarks
 * Of the ADSI system providers, only the WinNT provider supports this interface to handle active file service sessions, resources and print jobs.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadscollection
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsCollection extends IDispatch {
    /**
     * The interface identifier for IADsCollection
     * @type {Guid}
     */
    static IID := Guid("{72b945e0-253b-11cf-a988-00aa006bc149}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsCollection interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get__NewEnum : IntPtr
        Add          : IntPtr
        Remove       : IntPtr
        GetObject    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsCollection.Vtbl()
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
     * The IADsCollection::get__NewEnum method gets a dependent enumerator object that implements IEnumVARIANT for this ADSI collection object. Be aware that there are two underscore characters in the function name (get__NewEnum).
     * @remarks
     * When a server supports paged search and the client has specified the page limit greater than the maximum search results allowed on the server, the <b>IADsCollection::get__NewEnum</b> method returns errors in the following ways:
     * 
     * <ul>
     * <li>If the server returns an error with no results, the function returns the error only.</li>
     * <li>If the server returns partial results with or without an error, for example, the maximum search results allowed on the server, the function returns the partial results from the server to the user.</li>
     * <li>If the server returns all results with or without an error, for example, maximum search results on each page and all results through multiple pages, the function returns all the results from the server to the user.</li>
     * </ul>
     * @returns {IUnknown} Pointer to a pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface on the enumerator object for this collection.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadscollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &ppEnumerator := 0, "HRESULT")
        return IUnknown(ppEnumerator)
    }

    /**
     * Adds a named item to the collection.
     * @remarks
     * Collections for a directory service can also consist of a set of immutable objects.
     * 
     * This method is not supported in any of the  <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-system-providers">ADSI system providers</a>.
     * @param {BSTR} bstrName The <b>BSTR</b> value that specifies the item name.  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iadscollection-getobject">IADsCollection::GetObject</a> and  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iadscollection-remove">IADsCollection::Remove</a> reference the item by this name.
     * @param {VARIANT} vItem Item value. When the item is an object, this parameter holds the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface pointer on the object.
     * @returns {HRESULT} This method supports the standard return values, as well as the following.
     *       
     * 
     * For more information and other return values, see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadscollection-add
     */
    Add(bstrName, vItem) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(8, this, BSTR, bstrName, VARIANT, vItem, "HRESULT")
        return result
    }

    /**
     * The IADsCollection::Remove method removes the named item from this ADSI collection object.
     * @remarks
     * Collections for a directory service can also consist of a set of immutable objects.
     * 
     * Collections that do not support direct removal of items are required to return <b>E_NOTIMPL</b>.
     * @param {BSTR} bstrItemToBeRemoved The null-terminated Unicode string that specifies the name of the item as it was specified by  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iadscollection-add">IADsCollection::Add</a>.
     * @returns {HRESULT} This method supports the standard return values, including <b>S_OK</b>. For more information and other return values, see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadscollection-remove
     */
    Remove(bstrItemToBeRemoved) {
        bstrItemToBeRemoved := bstrItemToBeRemoved is String ? BSTR.Alloc(bstrItemToBeRemoved).Value : bstrItemToBeRemoved

        result := ComCall(9, this, BSTR, bstrItemToBeRemoved, "HRESULT")
        return result
    }

    /**
     * Retrieves an item of the collection.
     * @remarks
     * If you know the name of a session in the <b>Sessions</b> collection, call the <b>IADsCollection::GetObject</b> method explicitly to retrieve the session object.
     * @param {BSTR} bstrName The null-terminated Unicode string that specifies the name of the item. This is the same name passed to  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iadscollection-add">IADsCollection::Add</a> when the item is added to the collection.
     * @returns {VARIANT} Current value of the item. For an object, this corresponds to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface pointer on the object.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadscollection-getobject
     */
    GetObject(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        pvItem := VARIANT()
        result := ComCall(10, this, BSTR, bstrName, VARIANT.Ptr, pvItem, "HRESULT")
        return pvItem
    }

    Query(iid) {
        if (IADsCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
        this.vtbl.Add := CallbackCreate(GetMethod(implObj, "Add"), flags, 3)
        this.vtbl.Remove := CallbackCreate(GetMethod(implObj, "Remove"), flags, 2)
        this.vtbl.GetObject := CallbackCreate(GetMethod(implObj, "GetObject"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get__NewEnum)
        CallbackFree(this.vtbl.Add)
        CallbackFree(this.vtbl.Remove)
        CallbackFree(this.vtbl.GetObject)
    }
}
