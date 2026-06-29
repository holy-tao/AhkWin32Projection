#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IPortableDevicePropVariantCollection interface holds a collection of indexed PROPVARIANT values of the same VARTYPE.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicepropvariantcollection
 * @namespace Windows.Win32.Devices.PortableDevices
 */
export default struct IPortableDevicePropVariantCollection extends IUnknown {
    /**
     * The interface identifier for IPortableDevicePropVariantCollection
     * @type {Guid}
     */
    static IID := Guid("{89b2e422-4f1b-4316-bcef-a44afea83eb3}")

    /**
     * The class identifier for PortableDevicePropVariantCollection
     * @type {Guid}
     */
    static CLSID := Guid("{08a99e2f-6d6d-4b80-af5a-baf2bcbe4cb9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPortableDevicePropVariantCollection interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCount   : IntPtr
        GetAt      : IntPtr
        Add        : IntPtr
        GetType    : IntPtr
        ChangeType : IntPtr
        Clear      : IntPtr
        RemoveAt   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPortableDevicePropVariantCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetCount method retrieves the number of items in this collection.
     * @param {Pointer<Integer>} pcElems Pointer to a **DWORD** that contains the number of items in the collection.
     * @returns {HRESULT} The method returns an **HRESULT**. Possible values include, but are not limited to, those in the following table.
     * 
     * 
     * 
     * | Return code                                                                               | Description                                          |
     * |-------------------------------------------------------------------------------------------|------------------------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl>      | The method succeeded.<br/>                     |
     * | <dl> <dt>**E\_POINTER**</dt> </dl> | A required pointer argument was **NULL**.<br/> |
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicepropvariantcollection-getcount
     */
    GetCount(pcElems) {
        pcElemsMarshal := pcElems is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pcElemsMarshal, pcElems, "HRESULT")
        return result
    }

    /**
     * IPortableDevicePropVariantCollection::GetAt method - The GetAt method retrieves an item from the collection by a zero-based index.
     * @param {Integer} dwIndex 
     * @param {Pointer<PROPVARIANT>} pValue Pointer to a **PROPVARIANT** structure. The caller is responsible for freeing this memory by calling **PropVariantClear**.
     * @returns {HRESULT} The method returns an **HRESULT**. Possible values include, but are not limited to, those in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                               |
     * |----------------------------------------------------------------------------------------------|-----------------------------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl>         | The method succeeded.<br/>                          |
     * | <dl> <dt>**E\_POINTER**</dt> </dl>    | A required pointer argument was **NULL**.<br/>      |
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The index that was passed in was out of range.<br/> |
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicepropvariantcollection-getat
     */
    GetAt(dwIndex, pValue) {
        result := ComCall(4, this, "uint", dwIndex, PROPVARIANT.Ptr, pValue, "HRESULT")
        return result
    }

    /**
     * IPortableDevicePropVariantCollection::Add method - The Add method adds an item to the collection.
     * @remarks
     * When the VARTYPE for *pValue* is VT\_VECTOR or VT\_UI1, setting and retrieving a **NULL** or zero-sized buffer is not supported. For example, neither pValue.caub.pElems = **NULL** nor pValue.caub.cElems = 0 are allowed.
     * 
     * If a caller tries to add an item of a different VARTYPE contained in the collection and the PROPVARIANT value cannot be changed by this interface automatically, this method will fail. To change the collection type manually, call [**IPortableDevicePropVariantCollection::ChangeType**](iportabledevicepropvariantcollection-changetype.md).
     * @param {Pointer<PROPVARIANT>} pValue Pointer to a new **PROPVARIANT** object to add to the collection. This method copies the **PROPVARIANT** to the collection, so you should release your local copy of the variable by calling **PropVariantClear** after calling this method.
     * @returns {HRESULT} The method returns an **HRESULT**. Possible values include, but are not limited to, those in the following table.
     * 
     * 
     * 
     * | Return code                                                                          | Description                      |
     * |--------------------------------------------------------------------------------------|----------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl> | The method succeeded.<br/> |
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicepropvariantcollection-add
     */
    Add(pValue) {
        result := ComCall(5, this, PROPVARIANT.Ptr, pValue, "HRESULT")
        return result
    }

    /**
     * The GetType method retrieves the data type of the items in the collection.
     * @remarks
     * All items that are stored in an **IPortableDevicePropVariantCollection** are the same type.
     * @returns {Integer} A Platform SDK **VARTYPE** enumeration value that indicates the data type of all the items in the collection.
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicepropvariantcollection-gettype
     */
    GetType() {
        result := ComCall(6, this, "ushort*", &pvt := 0, "HRESULT")
        return pvt
    }

    /**
     * The ChangeType method converts all items in the collection to the specified VARTYPE.
     * @remarks
     * If this method fails, the collection may be left in an intermediate state, with some members converted and some not converted.
     * @param {Integer} vt Specifies the **VARTYPE** to which you want to convert all items in the collection. Example types include VT\_UI4 and VT\_UI8.
     * @returns {HRESULT} The method returns an **HRESULT**. Possible values include, but are not limited to, those in the following table.
     * 
     * 
     * 
     * | Return code                                                                          | Description                      |
     * |--------------------------------------------------------------------------------------|----------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl> | The method succeeded.<br/> |
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicepropvariantcollection-changetype
     */
    ChangeType(vt) {
        result := ComCall(7, this, "ushort", vt, "HRESULT")
        return result
    }

    /**
     * The Clear method frees, and then removes, all items from the collection. The collection is considered empty after calling this method.
     * @remarks
     * After calling **Clear**, the collection is considered type-less, meaning that the VARTYPE it was previously set to is no longer restricting **Add** operations. A call to **Add** after calling **Clear** is considered the "first" **Add** for this collection.
     * @returns {HRESULT} This method has no parameters.
     * 
     * 
     * The method returns an **HRESULT**. Possible values include, but are not limited to, those in the following table.
     * 
     * 
     * 
     * | Return code                                                                          | Description                      |
     * |--------------------------------------------------------------------------------------|----------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl> | The method succeeded.<br/> |
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicepropvariantcollection-clear
     */
    Clear() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * IPortableDevicePropVariantCollection::RemoveAt method - The RemoveAt method removes the element stored at the location specified by the given index.
     * @remarks
     * You must specify a zero-based index.
     * @param {Integer} dwIndex Specifies the index of the element to be removed.
     * @returns {HRESULT} The method returns an **HRESULT**. Possible values include, but are not limited to, those in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl>         | The method succeeded.<br/>                 |
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The specified index was out of range.<br/> |
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicepropvariantcollection-removeat
     */
    RemoveAt(dwIndex) {
        result := ComCall(9, this, "uint", dwIndex, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPortableDevicePropVariantCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCount := CallbackCreate(GetMethod(implObj, "GetCount"), flags, 2)
        this.vtbl.GetAt := CallbackCreate(GetMethod(implObj, "GetAt"), flags, 3)
        this.vtbl.Add := CallbackCreate(GetMethod(implObj, "Add"), flags, 2)
        this.vtbl.GetType := CallbackCreate(GetMethod(implObj, "GetType"), flags, 2)
        this.vtbl.ChangeType := CallbackCreate(GetMethod(implObj, "ChangeType"), flags, 2)
        this.vtbl.Clear := CallbackCreate(GetMethod(implObj, "Clear"), flags, 1)
        this.vtbl.RemoveAt := CallbackCreate(GetMethod(implObj, "RemoveAt"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCount)
        CallbackFree(this.vtbl.GetAt)
        CallbackFree(this.vtbl.Add)
        CallbackFree(this.vtbl.GetType)
        CallbackFree(this.vtbl.ChangeType)
        CallbackFree(this.vtbl.Clear)
        CallbackFree(this.vtbl.RemoveAt)
    }
}
