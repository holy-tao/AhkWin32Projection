#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents an ordered list of strings.
 * @remarks
 * This interface can be instantiated by using the StringCollection coclass. Use the Microsoft.Update.StringColl program identifier to create the object.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-istringcollection
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IStringCollection extends IDispatch {
    /**
     * The interface identifier for IStringCollection
     * @type {Guid}
     */
    static IID := Guid("{eff90582-2ddc-480f-a06d-60f3fbc362c3}")

    /**
     * The class identifier for StringCollection
     * @type {Guid}
     */
    static CLSID := Guid("{72c97d74-7c3b-40ae-b77d-abdb22eba6fb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IStringCollection interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Item     : IntPtr
        put_Item     : IntPtr
        get__NewEnum : IntPtr
        get_Count    : IntPtr
        get_ReadOnly : IntPtr
        Add          : IntPtr
        Clear        : IntPtr
        Copy         : IntPtr
        Insert       : IntPtr
        RemoveAt     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IStringCollection.Vtbl()
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
     * @type {VARIANT_BOOL} 
     */
    ReadOnly {
        get => this.get_ReadOnly()
    }

    /**
     * Gets or sets a string in the collection. (Get)
     * @param {Integer} index 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-istringcollection-get_item
     */
    get_Item(index) {
        retval := BSTR.Owned()
        result := ComCall(7, this, "int", index, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets or sets a string in the collection. (Put)
     * @param {Integer} index 
     * @param {BSTR} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-istringcollection-put_item
     */
    put_Item(index, value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(8, this, "int", index, BSTR, value, "HRESULT")
        return result
    }

    /**
     * Gets an IEnumVARIANT interface that can be used to enumerate the collection. (IStringCollection.get__NewEnum)
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-istringcollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &retval := 0, "HRESULT")
        return IUnknown(retval)
    }

    /**
     * Gets the number of elements in the collection. (IStringCollection.get_Count)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-istringcollection-get_count
     */
    get_Count() {
        result := ComCall(10, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets a Boolean value that indicates whether the collection is read-only.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-istringcollection-get_readonly
     */
    get_ReadOnly() {
        result := ComCall(11, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Adds an item to the collection. (IStringCollection.Add)
     * @param {BSTR} value A string to be added to the collection.
     * @returns {Integer} The index of the added interface in the collection.
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-istringcollection-add
     */
    Add(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(12, this, BSTR, value, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Removes all the elements from the collection. (IStringCollection.Clear)
     * @returns {HRESULT} Returns <b>S_OK</b> if successful. Otherwise, returns a COM or Windows error code. 
     * 
     * This method can also return the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WU_E_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The collection is read-only.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-istringcollection-clear
     */
    Clear() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * Creates a deep read/write copy of the collection.
     * @returns {IStringCollection} A deep read/write copy of the collection.
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-istringcollection-copy
     */
    Copy() {
        result := ComCall(14, this, "ptr*", &retval := 0, "HRESULT")
        return IStringCollection(retval)
    }

    /**
     * Inserts an item into the collection at the specified position. (IStringCollection.Insert)
     * @param {Integer} index The position at which a new string is inserted.
     * @param {BSTR} value The string to be inserted.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful. Otherwise, returns a COM or Windows error code. 
     * 
     * This method can also return the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WU_E_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The collection is read-only.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WU_E_INVALIDINDEX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An index is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-istringcollection-insert
     */
    Insert(index, value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(15, this, "int", index, BSTR, value, "HRESULT")
        return result
    }

    /**
     * Removes the item at the specified index from the collection. (IStringCollection.RemoveAt)
     * @param {Integer} index The index of the string to be removed.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful. Otherwise, returns a COM or Windows error code. 
     * 
     * This method can also return the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WU_E_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The collection is read-only.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WU_E_INVALIDINDEX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An index is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-istringcollection-removeat
     */
    RemoveAt(index) {
        result := ComCall(16, this, "int", index, "HRESULT")
        return result
    }

    Query(iid) {
        if (IStringCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Item := CallbackCreate(GetMethod(implObj, "get_Item"), flags, 3)
        this.vtbl.put_Item := CallbackCreate(GetMethod(implObj, "put_Item"), flags, 3)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.get_ReadOnly := CallbackCreate(GetMethod(implObj, "get_ReadOnly"), flags, 2)
        this.vtbl.Add := CallbackCreate(GetMethod(implObj, "Add"), flags, 3)
        this.vtbl.Clear := CallbackCreate(GetMethod(implObj, "Clear"), flags, 1)
        this.vtbl.Copy := CallbackCreate(GetMethod(implObj, "Copy"), flags, 2)
        this.vtbl.Insert := CallbackCreate(GetMethod(implObj, "Insert"), flags, 3)
        this.vtbl.RemoveAt := CallbackCreate(GetMethod(implObj, "RemoveAt"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Item)
        CallbackFree(this.vtbl.put_Item)
        CallbackFree(this.vtbl.get__NewEnum)
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.get_ReadOnly)
        CallbackFree(this.vtbl.Add)
        CallbackFree(this.vtbl.Clear)
        CallbackFree(this.vtbl.Copy)
        CallbackFree(this.vtbl.Insert)
        CallbackFree(this.vtbl.RemoveAt)
    }
}
